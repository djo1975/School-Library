require_relative './person'

class Student < Person
  def initialize(id, age, name, parent_permission)
    super(id, age, name: name, parent_permission: parent_permission)
    @rentals = []
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
