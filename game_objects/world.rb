require 'components/event_bus'
require 'game_objects/player'
require 'game_objects/room'
require 'lib/string_extensions'

module World
  @objects = []
  @event_bus = EventBus.new

  module_function

  def objects
    return @objects
  end

  def add(object)
    @objects << object
  end

  def find_player(name)
    return @objects.find { |object| object.is_a?(Player) && object.name == name }
  end

  def find_room(id)
    return @objects.find { |object| object.is_a?(Room) && object.id == id }
  end

  def players
    return @objects.select { |object| object.is_a?(Player) }
  end

  def find_objects_responding_to(message)
    return @objects.select { |object| object.respond_to?(message) }
  end

  def enqueue_event(event)
    @event_bus.enqueue(event)
  end

  def process_events
    @event_bus.pump
  end

  def build_sample
    @objects.clear
    @event_bus = EventBus.new

    add(Room.new(0, 'A forest', 'The verdant trees tower above you.'))
  end
end