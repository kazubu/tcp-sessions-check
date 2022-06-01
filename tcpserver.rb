#!/usr/bin/env ruby
require 'socket'

server = TCPServer.new('0.0.0.0', 12345)

loop do
  socket = server.accept
  Thread.start(socket) do |s|
    puts 'connection accepted'
    begin
      loop do
        buf = s.readpartial(10)
        $stdout.write(buf)
      end
    rescue => e
      print e.backtrace.join("\n")
    ensure
      s.close
    end
  end
end

