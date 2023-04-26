require_relative '../classroom'
require_relative '../student'

describe Classroom do
  let(:classroom) { Classroom.new('History') }
  let(:student) { Student.new(1, 17, 'John Doe', true) }

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'sets the classroom property of the student' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
