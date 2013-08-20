require 'game_objects/player'
require 'game_objects/room'
require 'lib/string_extensions'

module World
  @objects = []

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

  def send_event(event)
    unqualified_name = event.class.name.split('::').last
    message_name = "handle_#{unqualified_name.to_snake_case}_event"
    message = message_name.to_sym
    find_objects_responding_to(message).each do |object|
      object.send(message, event)
    end
  end
end