# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

defmodule Giraphe.IO.Query.Dummy do
  @moduledoc false

  @behaviour Giraphe.IO.Query

  defp _query_addresses(target)
      when target in [
        "192.0.2.2",
        "192.0.2.6",
        "198.51.100.1",
      ]
  do
    [ "192.0.2.2/31",
      "192.0.2.4/31",
      "192.0.2.6/31",
      "192.0.2.254/31",
      "198.51.100.1/29",
      "198.51.100.9/29",
      "198.51.100.17/29",
    ]
  end
  defp _query_addresses("192.0.2.7") do
    [ "192.0.2.7/31",
      "192.0.2.10/31",
      "198.51.100.25/29",
      "198.51.100.33/29",
    ]
  end
  defp _query_addresses(target)
      when target in [
        "192.0.2.3",
        "192.0.2.8",
      ]
  do
    [ "192.0.2.3/31",
      "192.0.2.8/31",
    ]
  end
  defp _query_addresses("192.0.2.9") do
    [ "192.0.2.13/30",
      "192.0.2.9/31",
      "192.0.2.11/31",
      "192.0.2.5/31",
    ]
  end
  defp _query_addresses("192.0.2.1") do
    [ "192.0.2.1/31",
      "198.51.100.1/29",
    ]
  end
  defp _query_addresses("203.0.113.2"),
    do: ["203.0.113.2/32"]

  defp _query_addresses("203.0.113.3"),
    do: ["203.0.113.3/32"]

  defp _query_addresses("203.0.113.4"),
    do: ["203.0.113.4/32"]

  defp _query_addresses("203.0.113.5"),
    do: ["203.0.113.5/32"]

  defp _query_addresses("203.0.113.7"),
    do: ["203.0.113.7/31", "203.0.113.8/31"]

  defp _query_addresses("203.0.113.9"),
    do: ["203.0.113.9/31"]

  defp _query_addresses("203.0.113.10") do
    [ "203.0.113.10/32",
      "203.0.113.12/31",
    ]
  end

  defp _query_addresses("203.0.113.11") do
    [ "203.0.113.11/32",
      "203.0.113.13/31",
    ]
  end

  defp _query_addresses("203.0.113.14"),
    do: ["203.0.113.14/31"]

  defp _query_addresses(_target),
    do: []

  defp _query_arp_cache("192.0.2.1") do
    [ {  "192.0.2.1", "00:00:00:00:00:01"},
      {  "192.0.2.3", "00:00:00:00:00:03"},
      {  "192.0.2.7", "00:00:00:00:00:07"},
      { "192.0.2.10", "00:00:00:00:00:10"},
      { "192.0.2.20", "00:00:00:00:00:20"},
      { "192.0.2.30", "00:00:00:00:00:30"},
      { "192.0.2.40", "00:00:00:00:00:40"},
      { "192.0.2.50", "00:00:00:00:00:50"},
      { "192.0.2.51", "00:00:00:00:00:51"},
      { "192.0.2.52", "00:00:00:00:00:52"},
      { "192.0.2.53", "00:00:00:00:00:53"},
      { "192.0.2.54", "00:00:00:00:00:54"},
      { "192.0.2.55", "00:00:00:00:00:55"},
      { "192.0.2.56", "00:00:00:00:00:56"},
      { "192.0.2.57", "00:00:00:00:00:57"},
      { "192.0.2.58", "00:00:00:00:00:58"},
      { "192.0.2.59", "00:00:00:00:00:59"},
      { "192.0.2.60", "00:00:00:00:00:60"},
      { "192.0.2.70", "00:00:00:00:00:70"},
      { "192.0.2.80", "00:00:00:00:00:80"},
      { "192.0.2.90", "00:00:00:00:00:90"},
      {"192.0.2.100", "00:00:00:00:01:00"},
      {"192.0.2.101", "00:00:00:00:01:01"},
      {"192.0.2.102", "00:00:00:00:01:02"},
      {"192.0.2.103", "00:00:00:00:01:03"},
      {"192.0.2.104", "00:00:00:00:01:04"},
      {"192.0.2.105", "00:00:00:00:01:05"},
      {"192.0.2.106", "00:00:00:00:01:06"},
      {"192.0.2.107", "00:00:00:00:01:07"},
      {"192.0.2.108", "00:00:00:00:01:08"},
      {"192.0.2.109", "00:00:00:00:01:09"},
      {"192.0.2.110", "00:00:00:00:01:10"},
      {"192.0.2.120", "00:00:00:00:01:20"},
      {"192.0.2.130", "00:00:00:00:01:30"},
      {"192.0.2.140", "00:00:00:00:01:40"},
      {"192.0.2.150", "00:00:00:00:01:50"},
      {"192.0.2.160", "00:00:00:00:01:60"},
      {"192.0.2.170", "00:00:00:00:01:70"},
      {"192.0.2.180", "00:00:00:00:01:80"},
      {"192.0.2.190", "00:00:00:00:01:90"},
      {"192.0.2.200", "00:00:00:00:02:00"}
    ]
  end

  defp _query_arp_cache(_target),
    do: []

  defp _query_fdb("192.0.2.3") do
    [ {"Gi1/24", "00:00:00:00:00:01", 1},
      {"Gi1/1",  "00:00:00:00:00:07", 1},
      {"Gi1/1",  "00:00:00:00:00:10", 1},
      {"Gi1/1",  "00:00:00:00:00:20", 1},
      {"Gi1/1",  "00:00:00:00:00:30", 1},
      {"Gi1/1",  "00:00:00:00:00:40", 1},
      {"Gi1/1",  "00:00:00:00:00:50", 1},
      {"Gi1/1",  "00:00:00:00:00:51", 1},
      {"Gi1/1",  "00:00:00:00:00:52", 1},
      {"Gi1/1",  "00:00:00:00:00:53", 1},
      {"Gi1/1",  "00:00:00:00:00:54", 1},
      {"Gi1/1",  "00:00:00:00:00:55", 1},
      {"Gi1/1",  "00:00:00:00:00:56", 1},
      {"Gi1/1",  "00:00:00:00:00:57", 1},
      {"Gi1/1",  "00:00:00:00:00:58", 1},
      {"Gi1/1",  "00:00:00:00:00:59", 1},
      {"Gi1/1",  "00:00:00:00:00:60", 1},
      {"Gi1/1",  "00:00:00:00:00:70", 1},
      {"Gi1/1",  "00:00:00:00:00:80", 1},
      {"Gi1/1",  "00:00:00:00:00:90", 1},
      {"Gi1/1",  "00:00:00:00:01:00", 1},
      {"Gi1/1",  "00:00:00:00:01:01", 1},
      {"Gi1/1",  "00:00:00:00:01:02", 1},
      {"Gi1/1",  "00:00:00:00:01:03", 1},
      {"Gi1/1",  "00:00:00:00:01:04", 1},
      {"Gi1/1",  "00:00:00:00:01:05", 1},
      {"Gi1/1",  "00:00:00:00:01:06", 1},
      {"Gi1/1",  "00:00:00:00:01:07", 1},
      {"Gi1/1",  "00:00:00:00:01:08", 1},
      {"Gi1/1",  "00:00:00:00:01:09", 1},
      {"Gi1/1",  "00:00:00:00:01:10", 1},
      {"Gi1/1",  "00:00:00:00:01:20", 1},
      {"Gi1/1",  "00:00:00:00:01:30", 1},
      {"Gi1/1",  "00:00:00:00:01:40", 1},
      {"Gi1/1",  "00:00:00:00:01:50", 1},
      {"Gi1/1",  "00:00:00:00:01:60", 1},
      {"Gi1/1",  "00:00:00:00:01:70", 1},
      {"Gi1/1",  "00:00:00:00:01:80", 1},
      {"Gi1/1",  "00:00:00:00:01:90", 1},
      {"Gi1/1",  "00:00:00:00:02:00", 1}
    ]
  end
  defp _query_fdb("192.0.2.7") do
    [ {"Gi1/24", "00:00:00:00:00:01", 1},
      {"Gi1/1",  "00:00:00:00:00:10", 1},
      {"Gi1/2",  "00:00:00:00:00:20", 1},
      {"Gi1/3",  "00:00:00:00:00:30", 1},
      {"Gi1/4",  "00:00:00:00:00:40", 1},
      {"Gi1/5",  "00:00:00:00:00:50", 1},
      {"Gi1/5",  "00:00:00:00:00:51", 1},
      {"Gi1/5",  "00:00:00:00:00:52", 1},
      {"Gi1/5",  "00:00:00:00:00:53", 1},
      {"Gi1/5",  "00:00:00:00:00:54", 1},
      {"Gi1/5",  "00:00:00:00:00:55", 1},
      {"Gi1/5",  "00:00:00:00:00:56", 1},
      {"Gi1/5",  "00:00:00:00:00:57", 1},
      {"Gi1/5",  "00:00:00:00:00:58", 1},
      {"Gi1/5",  "00:00:00:00:00:59", 1},
      {"Gi1/6",  "00:00:00:00:00:60", 1},
      {"Gi1/7",  "00:00:00:00:00:70", 1},
      {"Gi1/8",  "00:00:00:00:00:80", 1},
      {"Gi1/9",  "00:00:00:00:00:90", 1},
      {"Gi1/10", "00:00:00:00:01:00", 1},
      {"Gi1/10", "00:00:00:00:01:01", 1},
      {"Gi1/10", "00:00:00:00:01:02", 1},
      {"Gi1/10", "00:00:00:00:01:03", 1},
      {"Gi1/10", "00:00:00:00:01:04", 1},
      {"Gi1/10", "00:00:00:00:01:05", 1},
      {"Gi1/10", "00:00:00:00:01:06", 1},
      {"Gi1/10", "00:00:00:00:01:07", 1},
      {"Gi1/10", "00:00:00:00:01:08", 1},
      {"Gi1/10", "00:00:00:00:01:09", 1},
      {"Gi1/11", "00:00:00:00:01:10", 1},
      {"Gi1/12", "00:00:00:00:01:20", 1},
      {"Gi1/13", "00:00:00:00:01:30", 1},
      {"Gi1/14", "00:00:00:00:01:40", 1},
      {"Gi1/15", "00:00:00:00:01:50", 1},
      {"Gi1/16", "00:00:00:00:01:60", 1},
      {"Gi1/17", "00:00:00:00:01:70", 1},
      {"Gi1/18", "00:00:00:00:01:80", 1},
      {"Gi1/19", "00:00:00:00:01:90", 1},
      {"Gi1/20", "00:00:00:00:02:00", 1}
    ]
  end
  defp _query_fdb("192.0.2.10") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.20") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.30") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.40") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.50") do
    [ {"Gi1/24", "00:00:00:00:00:01", 1},
      {"Gi1/1",  "00:00:00:00:00:51", 1},
      {"Gi1/2",  "00:00:00:00:00:52", 1},
      {"Gi1/3",  "00:00:00:00:00:53", 1},
      {"Gi1/4",  "00:00:00:00:00:54", 1},
      {"Gi1/5",  "00:00:00:00:00:55", 1},
      {"Gi1/5",  "00:00:00:00:00:56", 1},
      {"Gi1/5",  "00:00:00:00:00:57", 1},
      {"Gi1/5",  "00:00:00:00:00:58", 1},
      {"Gi1/5",  "00:00:00:00:00:59", 1}
    ]
  end
  defp _query_fdb("192.0.2.51") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.52") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.53") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.54") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.55") do
    [ {"Gi1/24", "00:00:00:00:00:01", 1},
      {"Gi1/1",  "00:00:00:00:00:56", 1},
      {"Gi1/2",  "00:00:00:00:00:57", 1},
      {"Gi1/3",  "00:00:00:00:00:58", 1},
      {"Gi1/4",  "00:00:00:00:00:59", 1}
    ]
  end
  defp _query_fdb("192.0.2.56") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.57") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.58") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.59") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.60") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.70") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.80") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.90") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.100") do
    [ {"Gi1/24", "00:00:00:00:00:01", 1},
      {"Gi1/1",  "00:00:00:00:01:01", 1},
      {"Gi1/2",  "00:00:00:00:01:02", 1},
      {"Gi1/3",  "00:00:00:00:01:03", 1},
      {"Gi1/4",  "00:00:00:00:01:04", 1},
      {"Gi1/5",  "00:00:00:00:01:05", 1},
      {"Gi1/6",  "00:00:00:00:01:06", 1},
      {"Gi1/7",  "00:00:00:00:01:07", 1},
      {"Gi1/8",  "00:00:00:00:01:08", 1},
      {"Gi1/9",  "00:00:00:00:01:09", 1}
    ]
  end
  defp _query_fdb("192.0.2.101") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.102") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.103") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.104") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.105") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.106") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.107") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.108") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.109") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.110") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.120") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.130") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.140") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.150") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.160") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.170") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.180") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.190") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb("192.0.2.200") do
    [{"Gi1/24", "00:00:00:00:00:01", 1}]
  end
  defp _query_fdb(_target) do
    []
  end

  defp _query_routes("192.0.2.1") do
    [{"192.0.2.0/24", "0.0.0.0"}]
  end

  defp _query_routes(target)
      when target in [
        "192.0.2.2",
        "192.0.2.6",
        "198.51.100.1",
      ]
  do
    [ {    "192.0.2.2/31", "0.0.0.0"},
      {    "192.0.2.4/31", "0.0.0.0"},
      {    "192.0.2.6/31", "0.0.0.0"},
      {    "192.0.2.8/31", "192.0.2.3"},
      {   "192.0.2.10/31", "192.0.2.7"},
      {   "192.0.2.12/30", "192.0.2.3"},
      { "198.51.100.0/29", "0.0.0.0"},
      { "198.51.100.8/29", "0.0.0.0"},
      {"198.51.100.16/29", "0.0.0.0"},
      {"198.51.100.24/29", "192.0.2.7"},
      {"198.51.100.32/29", "192.0.2.7"},
      {"198.51.100.40/29", "192.0.2.3"}
    ]
  end

  defp _query_routes("192.0.2.7") do
    [ {    "192.0.2.2/31", "192.0.2.6"},
      {    "192.0.2.4/31", "192.0.2.6"},
      {    "192.0.2.6/31", "0.0.0.0"},
      {    "192.0.2.8/31", "192.0.2.6"},
      {   "192.0.2.10/31", "0.0.0.0"},
      {   "192.0.2.12/30", "192.0.2.6"},
      { "198.51.100.0/29", "192.0.2.6"},
      { "198.51.100.8/29", "192.0.2.6"},
      {"198.51.100.16/29", "192.0.2.6"},
      {"198.51.100.24/29", "0.0.0.0"},
      {"198.51.100.32/29", "0.0.0.0"},
      {"198.51.100.40/29", "192.0.2.6"}
    ]
  end

  defp _query_routes(target)
      when target in [
        "192.0.2.3",
        "192.0.2.8",
      ]
  do
    [ {    "192.0.2.2/31", "0.0.0.0"},
      {    "192.0.2.4/31", "192.0.2.2"},
      {    "192.0.2.6/31", "192.0.2.2"},
      {    "192.0.2.8/31", "0.0.0.0"},
      {   "192.0.2.10/31", "192.0.2.2"},
      {   "192.0.2.12/30", "192.0.2.9"},
      { "198.51.100.0/29", "192.0.2.2"},
      { "198.51.100.8/29", "192.0.2.2"},
      {"198.51.100.16/29", "192.0.2.2"},
      {"198.51.100.24/29", "192.0.2.2"},
      {"198.51.100.32/29", "192.0.2.2"},
      {"198.51.100.40/29", "192.0.2.9"}
    ]
  end

  defp _query_routes("192.0.2.9") do
    [ {    "192.0.2.2/31", "192.0.2.8"},
      {    "192.0.2.4/31", "0.0.0.0"},
      {    "192.0.2.6/31", "192.0.2.8"},
      {    "192.0.2.8/31", "0.0.0.0"},
      {   "192.0.2.10/31", "0.0.0.0"},
      {   "192.0.2.12/30", "0.0.0.0"},
      { "198.51.100.0/29", "192.0.2.8"},
      { "198.51.100.8/29", "192.0.2.8"},
      {"198.51.100.16/29", "192.0.2.8"},
      {"198.51.100.24/29", "192.0.2.8"},
      {"198.51.100.32/29", "192.0.2.8"},
      {"198.51.100.40/29", "192.0.2.14"}
    ]
  end

  defp _query_routes("203.0.113.1") do
    [ {        "0.0.0.0/0", "203.0.113.16"},
      {   "203.0.113.1/32", "0.0.0.0"},
      {   "203.0.113.2/32", "203.0.113.2"},
      {   "203.0.113.3/32", "203.0.113.3"},
      {   "203.0.113.4/32", "203.0.113.3"},
      {   "203.0.113.5/32", "203.0.113.2"},
      {   "203.0.113.5/32", "203.0.113.3"},
      {  "203.0.113.16/31", "0.0.0.0"}
    ]
  end

  defp _query_routes("203.0.113.2") do
    [ {        "0.0.0.0/0", "203.0.113.1"},
      {   "203.0.113.1/32", "203.0.113.1"},
      {   "203.0.113.2/32", "0.0.0.0"},
      {   "203.0.113.3/32", "203.0.113.1"},
      {   "203.0.113.4/32", "203.0.113.4"},
      {   "203.0.113.5/32", "203.0.113.5"}
    ]
  end

  defp _query_routes("203.0.113.3") do
    [ {        "0.0.0.0/0", "203.0.113.1"},
      {   "203.0.113.1/32", "203.0.113.1"},
      {   "203.0.113.2/32", "203.0.113.1"},
      {   "203.0.113.3/32", "0.0.0.0"},
      {   "203.0.113.4/32", "203.0.113.4"},
      {   "203.0.113.5/32", "203.0.113.4"}
    ]
  end

  defp _query_routes("203.0.113.4") do
    [ {        "0.0.0.0/0", "203.0.113.3"},
      {   "203.0.113.1/32", "203.0.113.3"},
      {   "203.0.113.2/32", "203.0.113.2"},
      {   "203.0.113.3/32", "203.0.113.3"},
      {   "203.0.113.4/32", "0.0.0.0"},
      {   "203.0.113.5/32", "203.0.113.5"}
    ]
  end

  defp _query_routes("203.0.113.5") do
    [ {        "0.0.0.0/0", "203.0.113.2"},
      {        "0.0.0.0/0", "203.0.113.4"},
      {   "203.0.113.1/32", "203.0.113.2"},
      {   "203.0.113.1/32", "203.0.113.4"},
      {   "203.0.113.2/32", "203.0.113.2"},
      {   "203.0.113.3/32", "203.0.113.4"},
      {   "203.0.113.4/32", "203.0.113.4"},
      {   "203.0.113.5/32", "0.0.0.0"}
    ]
  end

  defp _query_routes("203.0.113.9") do
    [ {        "0.0.0.0/0", "203.0.113.8"},
      # '?' appears when column indices are missing. This is
      # observed during route churn.
      {   "203.0.113.8/31", "?"},
    ]
  end

  defp _query_routes("203.0.113.10") do
    [ {"203.0.113.10/32", "0.0.0.0"},
      {"203.0.113.11/32", "203.0.113.13"},
      {"203.0.113.12/31", "0.0.0.0"},
    ]
  end

  defp _query_routes("203.0.113.11") do
    [ {"203.0.113.10/32", "203.0.113.12"},
      {"203.0.113.11/32", "0.0.0.0"},
      {"203.0.113.12/31", "0.0.0.0"},
    ]
  end

  defp _query_routes("203.0.113.14") do
    [ {"203.0.113.14/31", "203.0.113.14"},
      {"203.0.113.14/32", "127.0.0.1"},
    ]
  end

  defp _query_routes(_target) do
    []
  end

  def query(:addresses, target) do
    addresses =
      target
        |> NetAddr.address
        |> _query_addresses
        |> Enum.map(&NetAddr.ip/1)

    case addresses do
      [] ->
        {:error, target, :addresses, :etimedout}

      _ ->
        {:ok, target, :addresses, addresses}
    end
  end
  def query(:arp_cache, target) do
    arp_cache =
      target
        |> NetAddr.address
        |> _query_arp_cache
        |> Enum.map(fn {ip, mac} ->
          {NetAddr.ip(ip), NetAddr.mac_48(mac)}
        end)

    {:ok, target, :arp_cache, arp_cache}
  end
  def query(:fdb, target) do
    fdb =
      target
        |> NetAddr.address
        |> _query_fdb
        |> Enum.map(fn {port, mac, vlan} ->
          {port, NetAddr.mac_48(mac), vlan}
        end)

    case fdb do
      [] ->
        {:error, target, :fdb, :etimedout}

      _ ->
        {:ok, target, :fdb, fdb}
    end
  end
  def query(:routes, target) do
    routes =
      target
        |> NetAddr.address
        |> _query_routes
        |> Enum.map(fn {destination, next_hop} ->
          {NetAddr.ip(destination), NetAddr.ip(next_hop)}
        end)

    case routes do
      [] ->
        {:error, target, :routes, :etimedout}

      _ ->
        {:ok, target, :routes, routes}
    end
  end
  def query(:sysname, target) do
    {:error, target, :sysname, :etimedout}
  end
end
