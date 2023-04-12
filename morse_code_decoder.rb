@dictionary = {
  '.-' => 'A',
  '-...' => 'B',
  '-.-.' => 'C',
  '-..' => 'D',
  '.' => 'E',
  '..-.' => 'F',
  '--.' => 'G',
  '....' => 'H',
  '..' => 'I',
  '.---' => 'J',
  '-.-' => 'K',
  '.-..' => 'L',
  '--' => 'M',
  '-.' => 'N',
  '---' => 'O',
  '.--.' => 'P',
  '--.-' => 'Q',
  '.-.' => 'R',
  '...' => 'S',
  '-' => 'T',
  '..-' => 'U',
  '...-' => 'V',
  '.--' => 'W',
  '-..-' => 'X',
  '-.--' => 'Y',
  '--..' => 'Z'
}

#first we'll need 3 methods
#decode a character
def decode_a_character(str)
	@dictionary[str]
end

decode_a_character('.-')
#decode a word

def decode_a_word (str)
  @word_array = []

  #we divide our word into isolated character
  simple_character = str.split
  simple_character.each do |i|
    @word_array.push(decode_a_character(i))
  end
end

decode_a_word('.-')
#decode the whole message
