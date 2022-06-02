#!/usr/bin/env ruby
require 'socket'
require 'pp'

Socket.udp_server_loop(22222) do |data, src|
  pp src
  src.reply data
end
