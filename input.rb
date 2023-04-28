module Input
  def self.title
    puts 'Enter book title:'
    gets.chomp
  end

  def self.author
    puts 'Enter book author:'
    gets.chomp
  end

  def self.person_choice
    puts 'Do you want to create a student(1) or a teacher(2)?[Input the number]: '
    gets.chomp.to_i
  end

  def self.name
    puts 'Enter name:'
    gets.chomp
  end

  def self.age
    puts 'Enter age:'
    gets.chomp.to_i
  end

  def self.parent_permission
    puts 'Does the student have parent permission? (y/n):'
    permission = gets.chomp.downcase
    permission == 'y'
  end

  def self.specialization
    puts 'Enter teacher specialization:'
    gets.chomp
  end

  def self.book_id(books)
    puts 'Enter book id:'
    list_books(books)
    gets.chomp.to_i
  end

  def self.person_id(people)
    puts 'Enter person id:'
    list_people(people)
    gets.chomp.to_i
  end

  def self.rental_date
    puts 'Enter rental date (yyyy-mm-dd):'
    gets.chomp
  end

  def self.list_books(books)
    books.each do |book|
      puts "ID: #{book.id}, Title: #{book.title}, Author: #{book.author}"
    end
  end

  def self.list_people(people)
    people.each do |person|
      if person.is_a?(Teacher)
        puts "[Teacher] ID:#{person.id}, Name:#{person.name}, Age:#{person.age}"
      elsif person.is_a?(Student)
        puts "[Student] ID:#{person.id}, Name:#{person.name}, Age:#{person.age}"
      end
    end
  end
end
