module World
  @objects = []

  module_function

  # We need this to reset everything between specs.  Using World as a
  # global singleton is probably a mistake but we'll run with it for now.
  def reset
    @objects.clear
  end

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