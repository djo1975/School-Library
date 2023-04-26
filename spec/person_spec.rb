require_relative '../person'

RSpec.describe Person do
  describe '#add_rental' do
    let(:person) { Person.new(1, 18) }
    let(:book) { instance_double('Book') }
    let(:date) { instance_double('Date') }

    it 'calls add_rental on the Book object' do
      expect(book).to receive(:add_rental).with(date, person)
      person.add_rental(date, book)
    end
  end

  describe '#can_use_services?' do
    let(:person) { Person.new(1, age) }

    context 'when the person is under 18' do
      let(:age) { 17 }

      it 'returns true when parent permission is given' do
        expect(person.can_use_services?).to eq(true)
      end

      it 'returns false when parent permission is not given' do
        person.instance_variable_set(:@parent_permission, false)
        expect(person.can_use_services?).to eq(false)
      end
    end

    context 'when the person is 18 or older' do
      let(:age) { 18 }

      it 'returns true' do
        expect(person.can_use_services?).to eq(true)
      end
    end
  end

  describe '#to_h' do
    let(:person) { Person.new(1, 18, name: 'Test Name', parent_permission: true) }

    it 'returns a hash with person details and rental details' do
      rental = instance_double('Rental', to_h: { book_id: 1, person_id: 1, date: '2023-04-25' })
      person.instance_variable_set(:@rentals, [rental])
      expect(person.to_h).to eq({
                                  id: 1,
                                  name: 'Test Name',
                                  age: 18,
                                  parent_permission: true,
                                  rentals: [rental.to_h]
                                })
    end
  end
end
