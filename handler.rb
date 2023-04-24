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
