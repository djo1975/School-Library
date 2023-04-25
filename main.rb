# main.rb

require_relative 'app'
require_relative 'main_menu'
require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'handler'
require_relative 'storage'

books = Storage.read_json(Storage::BOOKS_FILE).map do |book_data|
  Book.new(book_data['title'], book_data['author'])
end

people = Storage.read_json(Storage::PEOPLE_FILE).map do |person_data|
  if person_data['type'] == 'Teacher'
    Teacher.new(person_data['id'], person_data['age'], person_data['name'], person_data['parent_permission'],
                person_data['specialization'])
  else
    Student.new(person_data['id'], person_data['age'], person_data['name'], person_data['parent_permission'])
  end
end
rentals = Storage.read_json(Storage::RENTALS_FILE).map do |rental_data|
  Rental.new(people.find do |p|
               p.id == rental_data['person_id']
             end, books.find do |b|
                    b.id == rental_data['book_id']
                  end, rental_data['date'])
end
loop do
  display_menu
  choice = gets.chomp
  handle_choice(choice, books, people, rentals)
  break if choice == '7'
end

Storage.write_json(Storage::BOOKS_FILE, books.map(&:to_h))
Storage.write_json(Storage::PEOPLE_FILE, people.map(&:to_h))
Storage.write_json(Storage::RENTALS_FILE, rentals.map(&:to_h))
