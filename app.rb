require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'input'

# List all books
def list_books(books)
  books.each do |book|
    puts "Title: #{book.title}, Author: #{book.author}"
  end
end

# List all people
def list_people(people)
  people.each do |person|
    if person.is_a?(Teacher)
      puts "[Teacher] Name:#{person.name}, ID:#{person.id}, Age:#{person.age}"
    elsif person.is_a?(Student)
      puts "[Student] Name:#{person.name}, ID:#{person.id}, Age:#{person.age}"
    end
  end
end

# Create a person (teacher or student)
def create_person(people)
  choice = Input.person_choice
  age = Input.age
  name = Input.name
  parent_permission = Input.parent_permission

  case choice
  when 1
    person = Student.new(people.length + 1, age, name, parent_permission)
  when 2
    create_teacher(people, age, name, parent_permission)
    return
  else
    handle_invalid_choice
    return
  end

  people << person
  puts "Created person #{person.name}"
end

def create_teacher(people, age, name, parent_permission)
  specialization = Input.specialization
  person = Teacher.new(people.length + 1, age, name, parent_permission, specialization)
  people << person
  puts "Created teacher #{person.name}"
end

# Create a book
def create_book(books)
  title = Input.title
  author = Input.author
  book = Book.new(title, author)
  books << book
  puts "Created book #{book.title} by #{book.author}"
end

# Create a rental
def create_rental(people, books, rentals)
  book_id = Input.book_id(books)
  book = books.find { |b| b.id == book_id }

  return puts 'Book not found' unless book

  person_id = Input.person_id(people)
  person = people.find { |p| p.id == person_id }

  return puts 'Person not found' unless person

  rental_date = Input.rental_date
  rental = Rental.new(person, book, rental_date)
  rentals << rental
  puts "Created rental of '#{book.title}' by #{book.author} to #{person.name} on #{rental_date}"
end

def list_rentals(people, rentals)
  person_id = Input.person_id(people)
  person = people.find { |p| p.id == person_id }
  if person.nil?
    puts 'Person not found.'
  else
    rentals_for_person = rentals.select { |r| r.person.id == person_id }
    if rentals_for_person.empty?
      puts 'No rentals found for this person.'
    else
      puts 'Rentals:'
      rentals_for_person.each do |rental|
        puts "#{rental.date}: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end
end
