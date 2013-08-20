require 'events/look_event'

module Commands
  class LookCommand
    attr_reader :name

    def initialize
      @name = 'LOOK'
    end

    def try_to_handle(connection, input)
      if /^look$/i =~ input
        event = Events::LookEvent.new(connection.player)
        World.players.each { |listener| listener.handle_look_event(event) }
        return true
      else
        return false
      end
    end
  end
end