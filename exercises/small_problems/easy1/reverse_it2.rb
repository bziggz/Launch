def reverse_words(string)
  arr = string.split
  arr.map { |word| word.length >= 5 ? word.reverse! : word }
  arr.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS