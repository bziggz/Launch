
def palindrome?(string)  string == string.reverse
end


def parrlindrome?(array)
  array == array.reverse
end

def palindromes?(object)
  object == object.reverse
end

def real_palindrome?(string)
  string = string.downcase.delete("^a-z0-9")
  palindrome?(string)
end

def palindromic_number?(int)
  palindrome?(int.to_s) || palindrome?(sprintf("0%o", int))
end

p palindrome?("beneb")
p parrlindrome?([1 ,2, 3, 2, 1])
p palindromes?("beneb")
p palindromes?([1 ,2, 3, 2, 1])

puts "\n"

p real_palindrome?("BE' ,,n .eb")

puts "\n"

p palindromic_number?(34543) #== true
p palindromic_number?(123210) #== false
p palindromic_number?(22) #== true
p palindromic_number?(5) #== true
p palindromic_number?(06560)

