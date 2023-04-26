require_relative './person'
require_relative './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(id, age, name, parent_permission)
    super(id, age, name: name, parent_permission: parent_permission)
    @rentals = []
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def to_h
    {
      id: @id,
      age: @age,
      name: @name,
      parent_permission: @parent_permission,
      rentals: @rentals.map(&:to_h)
    }
  end
end
