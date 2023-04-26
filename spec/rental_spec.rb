require_relative '../rental'
require_relative '../person'
require_relative '../book'
RSpec.describe Rental do
  let(:book) { Book.new('The Lord of the Rings', 'J.R.R. Tolkien') }
  let(:person) { Person.new(1, 25) }
  describe '#initialize' do
    context 'with invalid arguments' do
      it 'raises an ArgumentError if the book object is invalid' do
        expect { Rental.new(person, 'invalid_book_object', '2023-04-25') }.to raise_error(ArgumentError)
      end
    end
    context 'with valid arguments' do
      let(:rental) { Rental.new(person, book, '2023-04-25') }
      it 'creates a new Rental object' do
        expect(rental).to be_an_instance_of(Rental)
      end
      it 'associates the rental with the person' do
        expect(person.rentals).to include(rental)
      end
      it 'associates the rental with the book' do
        expect(book.rentals).to include(rental)
      end
      it 'sets the rental date' do
        expect(rental.date).to eq('2023-04-25')
      end
    end
  end
  describe '#to_h' do
    let(:rental) { Rental.new(person, book, '2023-04-25') }
    it 'returns a hash with the rental details' do
      expect(rental.to_h).to eq({
                                  book_id: book.id,
                                  person_id: person.id,
                                  date: '2023-04-25'
                                })
    end
  end
end
