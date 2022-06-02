#!/usr/bin/env ruby

require 'socket'
host = ARGV[0]

MAX_COUNT = 65535

sockets = []

(1..MAX_COUNT).each{|c|
  puts 'count: ' + c.to_s
  begin
    s = TCPSocket.open(host, 22222)
    sockets << s
  rescue => e
    puts e
    puts 'errored count: ' + c.to_s
    exit -1
  end
  sleep 0.0025
}

