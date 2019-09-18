puts "What is your name?"

name = gets.chomp

if name =~ /\!/
  puts "HELLO #{name.chop.upcase}! STOP YELLING AT ME!!!"
else
  puts "Hello #{name}."
end
