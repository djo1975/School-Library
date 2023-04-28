# storage.rb

require 'json'

module Storage
  BOOKS_FILE = 'storage/books.json'.freeze
  PEOPLE_FILE = 'storage/people.json'.freeze
  RENTALS_FILE = 'storage/rentals.json'.freeze

  def self.read_json(file_path)
    if File.exist?(file_path) && !File.empty?(file_path)
      file = File.read(file_path)
      JSON.parse(file)
    else
      []
    end
  end

  def self.write_json(file_path, data)
    File.write(file_path, JSON.pretty_generate(data))
  end
end
