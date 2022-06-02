#!/usr/bin/env ruby

require 'socket'
host = ARGV[0]

MAX_COUNT = 65535

sockets = []
addr = Socket.pack_sockaddr_in(22222, host)

(1..MAX_COUNT).each{|c|
  #puts 'count: ' + c.to_s
  begin
    udp = UDPSocket.open()
    sockets << udp

    udp.send("#{c}\n", 0, addr)
    puts udp.gets
  rescue => e
    puts e
    puts 'errored count: ' + c.to_s
    exit -1
  end
  sleep 0.0025
}

