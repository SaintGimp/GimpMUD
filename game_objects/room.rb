class Room
  attr_reader :id
  attr_reader :name
  attr_reader :description

  def initialize(id, name, description)
    @id = id
    @name = name
    @description = description
  end

  def full_description
    return [@name, @description]
  end
end