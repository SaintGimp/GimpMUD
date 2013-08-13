require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'pry-debugger'
require 'pry-rescue'
require 'pry-stack_explorer'

require './world'
require './connection'

class Server
  def initialize
    names = %w(Alice Bob)
    (1..2).each do |i|
      connection = Connection.new
      connection.id = i
      World.add connection
      connection.receive "login #{names[i - 1]}"
    end
  end

  def run
    loop do
      print '> '
      input = gets.chomp

      return if input == 'exit'
      if input == 'pry'
        binding.pry
        next
      end

      input_parts = /(\d)\:(.*)/.match input
      if input_parts
        connection_id = input_parts[1].to_i
        connection = World.objects.find { |object| object.is_a?(Connection) && object.id == connection_id }
        connection.receive input_parts[2]
      else
        puts "Error: don't forget to specify which connection # you're using!"
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  Pry.rescue do
    server = Server.new
    server.run
  end
end