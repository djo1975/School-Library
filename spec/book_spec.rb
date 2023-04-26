require_relative '../book'

describe Book do
  let(:book) { Book.new('Pride and Prejudice', 'Jane Austen') }

  describe '#initialize' do
    it 'creates a book with a title and an author' do
      expect(book.title).to eq('Pride and Prejudice')
      expect(book.author).to eq('Jane Austen')
    end

    it 'generates an id for the book' do
      expect(book.id).not_to be_nil
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the book' do
      expected_hash = {
        id: book.id,
        title: book.title,
        author: book.author,
        rentals: []
      }
      expect(book.to_h).to eq(expected_hash)
    end
  end
  context 'when adding a new rental' do
    let(:person) { Person.new(24, 'Tomas') }

    it 'creates a new rental object and adds it to the rentals array' do
      rental = book.add_rental('2023-04-26', person)
      expect(rental).to be_an_instance_of(Rental)
      expect(book.rentals).to include(rental)
    end

    it 'adds the rental to the person object' do
      rental = book.add_rental('2023-04-26', person)
      expect(person.rentals).to include(rental)
    end
  end
end
