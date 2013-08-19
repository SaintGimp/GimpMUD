require 'world'
require 'player'

module Commands
  class LoginCommand
    attr_reader :name

    def initialize
      @name = 'LOGIN'
    end

    def try_to_handle(connection, input)
      if /^login\s+?(\w*)$/i =~ input
        player = Player.new(connection, Regexp.last_match(1))
        connection.attach_player(player)
        World.add(player)
        player.enter(World.find_room(0))

        connection.send_output("Logged in as #{player.name}")
        return true
      else
        return false
      end
    end
  end
end