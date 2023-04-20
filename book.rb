class Book
  attr_reader :id, :title, :author, :rentals

  @id_count = 0

  def initialize(title, author)
    @id = self.class.generate_id
    @title = title
    @author = author
    @rentals = []
  end

  def self.generate_id
    @id_count += 1
  end

  # ...
end
