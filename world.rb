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

  def players
    return @objects.select { |object| object.is_a?(Player) }
  end
end