# Copyright © 2016 Jonathan Storm <the.jonathan.storm@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See the COPYING.WTFPL file for more details.

defmodule Giraphe.L3.DiscoveryTest do
  use ExUnit.Case
  doctest Giraphe.L3.Discovery

  import Giraphe.L3.Discovery

  test "Returns tuple of routers and routes" do
    expected_routers =
      [ %Giraphe.Router{name: "192.0.2.3", polladdr: "192.0.2.3",
          addresses: ["192.0.2.3/31", "192.0.2.8/31"],
          routes: [
            {    "192.0.2.2/31", "0.0.0.0"},
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
        },
        %Giraphe.Router{name: "192.0.2.7", polladdr: "192.0.2.7",
          addresses: ["192.0.2.7/31", "192.0.2.10/31", "198.51.100.25/29", "198.51.100.33/29"],
          routes: [
            {    "192.0.2.2/31", "192.0.2.6"},
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
        },
        %Giraphe.Router{name: "192.0.2.9", polladdr: "192.0.2.9",
          addresses: ["192.0.2.13/30", "192.0.2.9/31", "192.0.2.10/31", "192.0.2.5/31"],
          routes: [
            {    "192.0.2.2/31", "192.0.2.8"},
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
        },
        %Giraphe.Router{name: "192.0.2.14", polladdr: "192.0.2.14", addresses: ["192.0.2.14/30"], routes: []},
        %Giraphe.Router{name: "198.51.100.1", polladdr: "198.51.100.1",
          addresses: ["192.0.2.2/31", "192.0.2.4/31", "192.0.2.6/31", "198.51.100.1/29", "198.51.100.9/29", "198.51.100.17/29"],
          routes: [
            {    "192.0.2.2/31", "0.0.0.0"},
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
        }
      ]

    routers = discover ["198.51.100.1"]

    assert routers == expected_routers
  end
end
