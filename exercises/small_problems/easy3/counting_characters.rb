puts "==> Please enter a word or phrase: "
word = gets.chomp
non_spaced_word = word.delete(" ")
puts "There are #{non_spaced_word.size} characters in \"#{word}\""