class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(person, book, date)
    raise ArgumentError, 'Invalid book object' unless book.is_a?(Book)

    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end

  def to_h
    {
      book_id: @book.id,
      person_id: @person.id,
      date: @date.to_s
    }
  end
end
