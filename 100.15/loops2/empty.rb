names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do 
  puts names.shift
  break if names.size == 0
end

# TO  REMOVE LAST -> FIRST

# loop do 
#   puts names.pop
#   break if names.empty?
# end

