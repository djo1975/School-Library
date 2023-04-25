class Book
  attr_reader :id, :title, :author, :rentals

  @id_count = 0

  def initialize(title, author)
    @id = Book.generate_id
    @title = title
    @author = author
    @rentals = []
  end

  def self.generate_id
    @id_count += 1
  end

  def add_rental(person, date)
    rental = Rental.new(person, self, date)
    @rentals << rental
    rental
  end

  def to_h
    {
      id: @id,
      title: @title,
      author: @author,
      rentals: @rentals.map(&:to_h)
    }
  end
end
