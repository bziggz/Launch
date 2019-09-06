def numrange
  puts "Enter a number between 0 and 100:"
  num = gets.chomp.to_f

  case num
  when -Float::INFINITY...0
    puts "That is less than 0. Try again."
  when 0..50
    puts "You entered #{num}, which is between 0 and 50."
  when 50..100
    puts "You entered #{num}, which is between 51 and 100."
  else 
    puts "That is more than 100. Try again."
  end
end

numrange()