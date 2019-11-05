=begin 
SOURCE:

EXTRACT PROBLEM 

INPUT
  a string

EXAMPLE
  block_word?('BATCH') == true
  block_word?('BUTCH') == false
  block_word?('jest') == true
OUTPUT 
  boolean - T if string can be spelled using said blocks
EXPERIMENT / EDGE
  case insensitive
  same char appears twice == false
ALGO
  GIVEN a set of bi-letterd blocks
  GIVEN a string
  SET starting result == true
  UPCASE the word to match the blockss
  FOR EACH though each char in string
    IDENTIFY complement letter
    SEARCH word for complement letter
    IF word contains complement letter, change result to false
      otherwise true
  RETURN result
=end

BLOCKS = {
  "A" => "N", "B" => "O", "C" => "P", "D" => "Q", "E" => "R", "F" => "S", 
  "G" => "T", "H" => "U", "I" => "V", "J" => "W", "K" => "X", "L" => "Y", 
  "M" => "Z", "N" => "A", "O" => "B", "P" => "C", "Q" => "D", "R" => "E", 
  "S" => "F", "T" => "G", "U" => "H", "V" => "I", "W" => "J", "X" => "K", 
  "Y" => "L", "Z" => "M", 
}

def block_word?(word)
  word = word.upcase
  result = true

  word.each_char do |char|
    result = false if word.count(char) > 1 || word.include?(BLOCKS[char])
  end

  result
end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true