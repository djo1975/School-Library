require_relative '../student'
RSpec.describe Student do
  let(:student) { Student.new(1, 17, 'John Doe', true) }
  describe '#initialize' do
    it 'creates a new Student object' do
      expect(student).to be_an_instance_of(Student)
    end
    it 'sets the student name' do
      expect(student.name).to eq('John Doe')
    end
    it 'sets the student age' do
      expect(student.age).to eq(17)
    end
    it 'sets the parent permission' do
      expect(student.instance_variable_get(:@parent_permission)).to eq(true)
    end
  end
  describe '#play_hooky' do
    it 'returns a string of the shrug emoticon' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
  describe '#to_h' do
    it 'returns a hash with the student details' do
      expect(student.to_h).to eq({
                                   id: 1,
                                   age: 17,
                                   name: 'John Doe',
                                   parent_permission: true,
                                   rentals: []
                                 })
    end
  end
end
