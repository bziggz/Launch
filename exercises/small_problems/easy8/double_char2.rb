# START
# INPUT a string
# RETURN a new string
#   - every consonant char doubled
#   - every vowel, punctuation, or whitespace is left alone
# END

CONSONANTS = ("a".."z").to_a.keep_if { |char| !(char =~ /[aeiou]/) }

def double_consonants(str)
  new_str = ""
  str.each_char do |char|
    if CONSONANTS.include?(char.downcase)
      new_str << char * 2
    else
      new_str << char
    end
  end

  new_str
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""