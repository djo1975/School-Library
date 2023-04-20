require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'

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
  puts 'Do you want to create a student(1) or a teacher(2)?[Input the number]: '
  choice = gets.chomp.to_i
  print 'Enter age: '
  age = gets.chomp.to_i
  print 'Enter name: '
  name = gets.chomp
  print 'Does the person have parent permission? (y/n): '
  parent_permission = gets.chomp.downcase == 'y'

  case choice
  when 1
    person = Student.new(people.length + 1, age, name, parent_permission)
  when 2
    create_teacher(people, age, name, parent_permission)
    return
  else
    puts 'Invalid choice'
    return
  end

  people << person
  puts "Created person #{person.name}"
end

def create_teacher(people, age, name, parent_permission)
  print 'Enter specialization: '
  specialization = gets.chomp
  person = Teacher.new(people.length + 1, age, name, parent_permission, specialization)
  people << person
  puts "Created teacher #{person.name}"
end

# Create a book
def create_book(books)
  print 'Enter title: '
  title = gets.chomp
  print 'Enter author: '
  author = gets.chomp
  book = Book.new(title, author)
  books << book
  puts "Created book #{book.title} by #{book.author}"
end

# Create a rental
def create_rental(people, books, rentals)
  puts 'Select a book from the following list by number:'
  books.each { |book| puts "[#{book.id}] #{book.title} by #{book.author}" }
  book_id = gets.chomp.to_i
  book = books.find { |b| b.id == book_id }

  return puts 'Book not found' unless book

  puts 'Select a person from the following list by number:'
  people.each { |person| puts "[#{person.id}] #{person.name} (#{person.class})" }
  person_id = gets.chomp.to_i
  person = people.find { |p| p.id == person_id }

  return puts 'Person not found' unless person

  print 'Enter the rental date (YYYY-MM-DD): '
  rental_date = gets.chomp
  rental = Rental.new(person, book, rental_date)
  rentals << rental
  puts "Created rental of '#{book.title}' by #{book.author} to #{person.name} on #{rental_date}"
end

def list_rentals(people, rentals)
  puts 'Enter ID of person:'
  person_id = gets.chomp.to_i
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
