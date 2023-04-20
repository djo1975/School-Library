require_relative 'app'

def display_menu
  puts 'Welcome to School Library App!'
  puts
  puts 'Please choose an option by entering the number:'
  puts '  1. List all books'
  puts '  2. List all people'
  puts '  3. Create a person'
  puts '  4. Create a book'
  puts '  5. Create a rental'
  puts '  6. List all rentals for a given person id'
  puts '  7. Quit'
end

def handle_list_books(books)
  list_books(books)
end

def handle_list_people(people)
  list_people(people)
end

def handle_create_person(people)
  create_person(people)
end

def handle_create_book(books)
  create_book(books)
end

def handle_create_rental(people, books, rentals)
  create_rental(people, books, rentals)
end

def handle_list_rentals(people, rentals)
  list_rentals(people, rentals)
end

def handle_quit
  puts 'Thanks for using the School Library App!'
end

def handle_invalid_choice
  puts 'Invalid choice'
end

def handle_choice(choice, books, people, rentals)
  case choice
  when '1' then handle_list_books(books)
  when '2' then handle_list_people(people)
  when '3' then handle_create_person(people)
  when '4' then handle_create_book(books)
  when '5' then handle_create_rental(people, books, rentals)
  when '6', '7' then handle_choice_menu(choice, books, people, rentals)
  else handle_invalid_choice
  end

  choice == '7'
end

def handle_choice_menu(choice, _books, people, rentals)
  case choice
  when '6' then handle_list_rentals(people, rentals)
  when '7'
    handle_quit
    true
  else
    handle_invalid_choice
    false
  end
end

# Entry point of the console app
def main
  books = []
  people = []
  rentals = []

  loop do
    display_menu
    choice = gets.chomp.downcase
    break if handle_choice(choice, books, people, rentals)
  end
end

# Run the console app
main
