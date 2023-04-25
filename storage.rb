# storage.rb

require 'json'

module Storage
  BOOKS_FILE = 'storage/books.json'
  PEOPLE_FILE = 'storage/people.json'
  RENTALS_FILE = 'storage/rentals.json'

  def self.read_json(file_path)
    if File.exist?(file_path) && !File.zero?(file_path)
      file = File.read(file_path)
      JSON.parse(file)
    else
      []
    end
  end
  

  def self.write_json(file_path, data)
    File.open(file_path, 'w') do |file|
      file.write(JSON.pretty_generate(data))
    end
  end
end
