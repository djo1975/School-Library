require_relative './book'
require_relative './person'
require_relative './rental'

# Create some books and people
book1 = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
book2 = Book.new('To Kill a Mockingbird', 'Harper Lee')
person1 = Person.new(1, 25, name: 'Alice')
person2 = Person.new(2, 30, name: 'Bob')

# Add some rentals
book1.add_rental('2023-04-19', person1)
book1.add_rental('2023-04-20', person2)
book2.add_rental('2023-04-18', person1)

# Retrieve rentals for a book
puts "Rentals for #{book1.title}:"
book1.rentals.each do |rental|
  puts " - #{rental.date}, rented by #{rental.person.name}"
end

# Retrieve rentals for a person
puts "Rentals for #{person1.name}:"
person1.rentals.each do |rental|
  puts " - #{rental.date}, rented #{rental.book.title} by #{rental.book.author}"
end
