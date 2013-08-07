module Commands
  class SayCommand
    def try_to_handle(connection, input)
      if /^say\s+?(.*)$/i =~ input
        connection.send_output "You say, \"#{Regexp.last_match(1)}\""

        speaker = connection.player
        others = World.players.reject { |player| player == speaker }
        others.each { |other| other.send_output "#{speaker.name} says, \"#{Regexp.last_match(1)}\"" }
        return true
      else
        return false
      end
    end
  end
end