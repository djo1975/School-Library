require_relative '../teacher'
RSpec.describe Teacher do
  let(:teacher) { Teacher.new(1, 35, 'John Doe', true, 'Math') }
  describe '#initialize' do
    it 'creates a new teacher instance' do
      expect(teacher).to be_an_instance_of(Teacher)
    end
    it 'assigns an id' do
      expect(teacher.id).to eq(1)
    end
    it 'assigns an age' do
      expect(teacher.age).to eq(35)
    end
    it 'assigns a name' do
      expect(teacher.name).to eq('John Doe')
    end
    it 'assigns a parent permission' do
      expect(teacher.instance_variable_get(:@parent_permission)).to eq(true)
    end
    it 'assigns a specialization' do
      expect(teacher.specialization).to eq('Math')
    end
  end
  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
  describe '#to_h' do
    it 'returns a hash with teacher information' do
      expect(teacher.to_h).to eq({
                                   id: 1,
                                   age: 35,
                                   name: 'John Doe',
                                   parent_permission: true,
                                   specialization: 'Math'
                                 })
    end
  end
end
