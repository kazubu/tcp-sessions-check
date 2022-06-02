#!/usr/bin/env ruby

require 'timeout'
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

    begin
      Timeout.timeout(1){
        udp.send("#{c}\n", 0, addr)
        puts udp.gets
      }
    rescue Timeout::Error
      puts 'timeout'
      retry
    end
  rescue => e
    puts e
    puts 'errored count: ' + c.to_s
    exit -1
  end
}

