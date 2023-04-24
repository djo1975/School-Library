require_relative 'app'
require_relative 'main_menu'
require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'handler'

books = []
people = []
rentals = []

loop do
  display_menu
  choice = gets.chomp
  handle_choice(choice, books, people, rentals)
  break if choice == '7'
end
