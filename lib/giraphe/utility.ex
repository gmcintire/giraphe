# Copyright © 2016 Jonathan Storm <the.jonathan.storm@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See the COPYING.WTFPL file for more details.

defmodule Giraphe.Utility do
  def prefix_contains_address?(prefix, address) do
    NetAddr.contains? NetAddr.ipv4_cidr(prefix), NetAddr.ipv4(address)
  end

  def find_prefix_containing_address(prefixes, address) do
    if result = Enum.find prefixes, &prefix_contains_address?(&1, address) do
      result

    else
      nil
    end
  end

  def unzip_and_get_elem(zipped, e) do
    zipped
      |> Enum.unzip
      |> elem(e)
  end

  def get_destinations_from_routes(routes) do
    routes
      |> unzip_and_get_elem(0)
      |> Enum.sort
      |> Enum.dedup
  end

  def get_next_hops_from_routes(routes) do
    routes
      |> unzip_and_get_elem(1)
      |> Enum.sort
      |> Enum.dedup
  end

  def get_prefix_from_address(address) do
    NetAddr.prefix_to_ipv4_cidr NetAddr.ipv4_cidr(address)
  end

  def get_prefix_length(prefix) do
    NetAddr.ipv4_cidr(prefix).length
  end

  def sort_devices_by_polladdr_ascending(devices) do
    ipv6_string = "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff"
    key_length = String.length ipv6_string

    Enum.sort_by devices, &String.rjust(&1.polladdr, key_length), &(&1 < &2)
  end

  def rjust_and_concat(strings, lengths) do
    strings
      |> Enum.zip(lengths)
      |> Enum.map_join(fn {string, len} -> String.rjust(string, len) end)
  end

  def make_sort_key_from_prefix(prefix, sort_key_lengths) do
    prefix
      |> String.split("/")
      |> Enum.reverse
      |> rjust_and_concat(sort_key_lengths)
  end

  def sort_prefixes_by_length_descending(prefixes) do
    ipv6_string = "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff/128"
    lengths =
      ipv6_string
        |> String.split("/")
        |> Enum.reverse
        |> Enum.map(&String.length/1)

    prefixes
      |> Enum.sort_by(&make_sort_key_from_prefix(&1, lengths), &(&1 < &2))
      |> Enum.reverse
  end
end
