class Book
  attr_reader :id, :title, :author, :rentals

  def initialize(title, author)
    @id = rand(1000)
    @title = title
    @author = author
    @rentals = []
  end

  def to_h
    {
      id: @id,
      title: @title,
      author: @author,
      rentals: @rentals.map(&:to_h)
    }
  end

  def add_rental(date, person)
    rental = Rental.new(person, self, date)
    @rentals << rental
    person.rentals << rental
    rental
  end
end
