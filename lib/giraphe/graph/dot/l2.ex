# Copyright © 2016 Jonathan Storm <the.jonathan.storm@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See the COPYING.WTFPL file for more details.

defmodule Giraphe.Graph.Dot.L2 do
  @moduledoc """
  A grapher implementation for GraphViz dot.
  """

  @behaviour Giraphe.Graph

  alias Giraphe.Utility

  require Logger

  defp generate_dot(template, switches, edges, timestamp) do
    EEx.eval_file(
      template,
      [switches: switches, edges: edges, timestamp: timestamp]
    )
  end

  defp max_string_length(strings) do
    strings
      |> Stream.map(&String.length/1)
      |> Enum.max
  end

  defp pad_and_concat(strings, lengths) do
    strings
      |> Enum.zip(lengths)
      |> Enum.map_join(fn {string, len} -> String.pad_leading(string, len) end)
  end

  defp sort_l2_edges_by_upstream_polladdr_and_downlink(edges) do
    downlinks =
      edges
        |> Stream.map(&({&1, get_downlink_from_edge(&1)}))
        |> Enum.into(%{})

    ipv6_string = "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff"
    max_polladdr_len = String.length ipv6_string
    max_downlink_len = max_string_length Map.values(downlinks)

    lengths = [max_polladdr_len, max_downlink_len]

    Enum.sort_by edges, fn({_, upstream_switch} = edge) ->
      downlink = downlinks[edge]
      upstream_polladdr = NetAddr.address upstream_switch.polladdr

      pad_and_concat [upstream_polladdr, downlink], lengths
    end
  end

  defp get_downlink_from_edge({downstream_switch, upstream_switch}) do
    get_fdb_port_by_physaddr upstream_switch.fdb, downstream_switch.physaddr
  end

  defp get_fdb_port_by_physaddr(fdb, physaddr) do
    Enum.find_value fdb, fn {port, ^physaddr, _} -> port; _ -> nil end
  end

  defp uniq_edges_by_topologically_closest_switches(edges) do
    # Downstream switches often have many switches upstream of them. For each
    #   downstream switch, we only want the directly connected upstream switch.
    #
    # Finding the edge with the fewest FDB entries in the upstream switch yields
    #   the topologically closest pair of switches.
    edges
      |> Enum.group_by(fn {downstream_switch, _} -> downstream_switch end)
      |> Enum.map(fn {_, grouped_edges} ->
        Enum.min_by grouped_edges, fn {_, upstream_switch} ->
          length upstream_switch.fdb
        end
      end)
  end

  defp physaddr_in_fdb?(fdb, physaddr) do
    get_fdb_port_by_physaddr(fdb, physaddr) != nil
  end

  defp get_l2_edges(switches) do
    for downstream_switch <- switches,
        upstream_switch <- switches,
        #fdb_proper_subset?(downstream_switch.fdb, upstream_switch.fdb),
        physaddr_in_fdb?(upstream_switch.fdb, downstream_switch.physaddr)
    do
      {downstream_switch, upstream_switch}

    end |> uniq_edges_by_topologically_closest_switches
  end

  defp filter_switch_fdb(switch, fun) do
    %{switch | fdb: Enum.filter(switch.fdb, &fun.(&1))}
  end

  defp remove_switch_fdb_entries_by_port(switch, portname) do
    filter_switch_fdb switch, fn {^portname, _, _} -> false; _ -> true end
  end

  defp intersect_switch_fdb_entries_with_physaddrs(switch, physaddrs) do
    filter_switch_fdb switch, fn {_, physaddr, _} -> physaddr in physaddrs end
  end

  @doc """
  Generate GraphViz dot from `switches`.
  """
  def graph_devices(switches, template) do
    graph_devices switches, "#{DateTime.utc_now}", template
  end

  @doc """
  Generate GraphViz dot from `switches` with timestamp.
  """
  def graph_devices(switches, timestamp, template) do
    switch_physaddrs = Enum.map switches, &(&1.physaddr)

    switches =
      for switch <- switches do
        switch
          |> remove_switch_fdb_entries_by_port(switch.uplink)
          |> intersect_switch_fdb_entries_with_physaddrs(switch_physaddrs)
          |> Utility.trim_domain_from_device_sysname
      end

    try do
      edges =
        switches
          |> get_l2_edges
          |> sort_l2_edges_by_upstream_polladdr_and_downlink

      generate_dot template, switches, edges, timestamp

    rescue
      _ in Enum.EmptyError ->
        :ok = Logger.error("No switch edges found")

        ""
    end
  end
end
