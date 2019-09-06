names = ["Jeffrey", "Walter", "Donnie", "Jesus", "Maude", "Bonnie", "The Dude"]

# names.each { |name| puts name }

x = 1

names.each do |name|
  puts "#{x}. #{name}"
  x += 1
end