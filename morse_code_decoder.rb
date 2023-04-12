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
def decode_a_character(string)
  @dictionary[string]
end

def decode_a_word(string)
  @text = []
  each = string.split
  each.each do |i|
    @new_word = decode_a_character(i)
    @text.push(@new_word)
  end
  print "#{@text.join} "
end

def decode_the_message(string)
  @split_the_string = string.split('   ')
  @split_the_string.each do |each|
    decode_a_word(each)
  end
end
decode_the_message('      .-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...')
