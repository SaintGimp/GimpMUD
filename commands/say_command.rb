require 'events/say_event'

module Commands
  class SayCommand
    attr_reader :name

    def initialize
      @name = 'SAY'
    end

    def try_to_handle(connection, input)
      if /^say\s+?(.*)$/i =~ input
        actor = connection.player
        event = Events::SayEvent.new(actor, Regexp.last_match(1))
        World.players.each { |listener| listener.handle_say_event(event) }
        return true
      else
        return false
      end
    end
  end
end