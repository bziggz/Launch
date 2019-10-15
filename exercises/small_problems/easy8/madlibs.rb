# START
# GET a noun, a verb, an adverb, and an adjective
# OUTPUT a story using those words
# END

def word_validator(word)
  word =~ /^[a-zA-Z]+$/
end

def get_word(word)
  answer = ''
  loop do
    puts word.start_with?("a") ? "Enter an #{word}:" : "Enter a #{word}:"
    answer = gets.chomp
    break if word_validator(answer)
    puts "Invalid response."
  end

  answer
end

noun = get_word("noun")
verb = get_word("verb")
adverb = get_word("adverb")
adjective = get_word("adjective")

puts "You #{verb}ed a #{adjective} #{noun} #{adverb}?! Weird..."