require_relative './person'
require_relative './classroom'

class Student < Person
  attr_reader :classroom

  def initialize(id, age, name: 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = nil
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def assign_to_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end
end
