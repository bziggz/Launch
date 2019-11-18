# SOURCE:

# EXTRACT PROBLEM

# INPUT
#    - a text file

# EXAMPLE

#   you know, a madlib

# OUTPUT

#   a complete madlib, with the blanks appropriately filled out

# EXPERIMENT / EDGE

#   non-existant text file

# ALGO

#   GIVEN a text file
#   INIT a hash { word_type => [words] }
#   READ the text file
#     DISPLAY error if error
#   SPLIT file in to word array
#   FOR EACH WORD 
#     if hash.keys.include? word then sub word with a sample from hash[word].
#   REJOiN text.
#   OUTPUT display completed madlib

WORDS = {
  "ADJECTIVE" => %w(sinister sticky blathering pea-brained hideous zippy metal yapping),
  "NOUN" => %w(tank psychic toilet hyena laser guy dragon barrier dirtbag supervisor),
  "PLURAL_NOUN" => %w(furnaces criminals ducks turds failures druggies puppies queens),
  "GAME" => %w(Schtoomps Euchre Four-Square DOOM Pac-Man poker tag horseshoes),
  "ING_VERB" => %w(abiding begging chewing flashing hooking rhyming screeching zipping),
  "PLANT" => %w(fig orchid dogwood maple mint fescue willow hydrangea milkweed),
  "BODY_PART" => %w(armpit toenail chest thumb belly-button earlobe eyelash)
}

text = File.read("madlibs.txt")

available_words = WORDS.dup

def substitute_word(word, available_words)
  if available_words.keys.include?(word)
    new_word = available_words[word].sample
    available_words[word].delete(new_word)
    word = new_word
  else
    word
  end
end

def format_new_word(word, temp_word)
  temp_word[0].upcase! if word[0].upcase == word[0]

  temp_word += case word[-1]
  when "." then "."
  when "!" then "!"
  when "?" then "?"
  when "," then ","
  else 
    ""
  end
end

new_text = text.split(' ').map do |word|
  temp_word = word.delete(".!?,")

  temp_word = substitute_word(temp_word, available_words)

  temp_word = format_new_word(word, temp_word)  
end.join(' ')

puts new_text

