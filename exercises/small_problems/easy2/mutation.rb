array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value.dup }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
puts array1

# will print ["Moe", "Larry", "Curly", "Shemp", "Harpo", "Chico", "Groucho", "Zeppo"]
# because the second invocation is modifying array1, not array2

# DAMMIT!!! Each entry in array2 is still pointing to the same object as 
# each entry in array1, so when they get modified, both arrays still point to them.

# TO AVOID: populate array2 with value.dup to that it's a duplicate
# array with similar values, or re-assign array1 using the
# non-desctictive version of upcase