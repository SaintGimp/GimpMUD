require 'events/entered_room'

class Player
  attr_reader :connection
  attr_reader :name

  def initialize(connection, name)
    @connection = connection
    @name = name
  end

  def enter(container)
    @container = container

    World.send_event(Events::EnteredRoom.new(self, container))
  end

  def send_output(output)
    connection.send_output(output)
  end

  def handle_say_event(event)
    if event.actor == self
      send_output("You say, \"#{event.text}\"")
    else
      send_output("#{event.actor.name} says, \"#{event.text}\"")
    end
  end

  def handle_look_event(event)
    if event.actor == self
      send_output(@container.full_description)
    else
      send_output("#{event.actor.name} looks around.")
    end
  end

  def handle_entered_room_event(event)
    if event.actor == self
      send_output(@container.full_description)
    end
  end
end