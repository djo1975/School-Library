class Teacher < Person
  attr_reader :specialization

  def initialize(id, age, name, parent_permission, specialization)
    super(id, age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
