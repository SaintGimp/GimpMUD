class Player
  attr_reader :connection
  attr_reader :name

  def initialize(connection, name)
    @connection = connection
    @name = name
  end

  def handle_say_event(event)
    if event.speaker == self
      send_output "You say, \"#{event.text}\""
    else
      send_output "#{event.speaker.name} says, \"#{event.text}\""
    end
  end

  def send_output(text)
    connection.send_output text
  end
end