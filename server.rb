require './connection'

class Server
  def initialize(connection = Connection.new)
    @connection = connection
  end
  
  def run
    while true
      print '> '
      input = gets.chomp
      @connection.receive input
    end
  end
end

if __FILE__ == $0
  server = Server.new
  server.run
end