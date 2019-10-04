def crunch(str)
  new_arr = []
  arr = str.split('')
  arr.each { |char| new_arr << char unless new_arr.last == char }
  new_arr.join
end

def further_crunch1(str)
  new_str = ''
  str.each_char { |char| new_str << char unless new_str.end_with?(char)}
  new_str
end

def further_crunch2(str)
  str.gsub(/(.)\1+/, '\1')
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('a') #== 'a'
p crunch('') #== ''

puts "\n"

p further_crunch1('ddaaiillyy ddoouubbllee') #== 'daily double'
p further_crunch1('4444abcabccba') #== '4abcabcba'
p further_crunch1('a') #== 'a'
p further_crunch1('')

puts "\n"

p further_crunch2('ddaaiillyy ddoouubbllee') #== 'daily double'
p further_crunch2('4444abcabccba') #== '4abcabcba'
p further_crunch2('a') #== 'a'
p further_crunch2('')