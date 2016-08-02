# Copyright © 2016 Jonathan Storm <the.jonathan.storm@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See the COPYING.WTFPL file for more details.

defmodule Giraphe.IO.HostScanner do
  @moduledoc """
  A behaviour for host-scanning implementations.
  """

  @doc "Scans all hosts in `subnet`."
  @callback scan(subnet :: NetAddr.t) :: :ok

  @doc "Tests whether 161/udp is open on `target`."
  @callback udp_161_open?(target :: NetAddr.t) :: boolean
end
