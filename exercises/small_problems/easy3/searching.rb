def prompt(message)
  puts "==> #{message}"
end

def count_message(count)
  case count
  when 1 then "1st"
  when 2 then "2nd"
  when 3 then "3rd"
  when 4 then "4th"
  when 5 then "5th"
  when 6 then "last"
  end
end

num_array = []
count = 1

6.times do 
  prompt "Enter the #{count_message(count)} number:"
  num_array << gets.chomp.to_i
  count += 1
end

num_pool = num_array[0..4]
last_num = num_array[5]

if num_pool.include?(last_num)
  puts "The number #{last_num} appears in #{num_pool}."
else
  puts "The number #{last_num} does not appear in #{num_pool}."
end

