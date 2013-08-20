class EventBus
  def initialize
    @events = Queue.new
  end

  def enqueue(event)
    @events << event
  end

  def pump
    until @events.empty?
      event = @events.deq

      unqualified_name = event.class.name.split('::').last
      message_name = "handle_#{unqualified_name.to_snake_case}_event"
      message = message_name.to_sym

      # TODO: we'll eventually want a more efficient routing algorithm
      # that doesn't touch every object in the world
      World.find_objects_responding_to(message).each do |object|
        object.send(message, event)
      end
    end
  end
end
