# 1 ------------

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}

flintstones.each_with_index { |name, index| flintstones_hash[name] = index }

puts "1) #{flintstones_hash}\n\n"

# 2 ------------

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, 
  "Marilyn" => 22, "Spot" => 237 }

total = ages.values.sum

puts "2) #{total}\n\n"

# 3 ------------

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.reject! { |name, age| age >= 100 }

puts "3) #{ages}\n\n"

# 4 ------------

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
  "Marilyn" => 22, "Spot" => 237 }

youngest = ages.values.min

puts "4) #{youngest}\n\n"

# 5 -------------

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

answer = flintstones.index { |name| name.start_with?("Be") }

puts "5) #{answer}\n\n"

# 6 -------------

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0, 3] }

puts "6) #{flintstones}\n\n"

# 7 -------------

statement = "The Flintstones Rock"
count_hash = {}

statement.delete!(" ")

statement.each_char do |char|
  count_hash.include?(char) ? count_hash[char] += 1 : count_hash[char] = 1
end

puts "7) #{count_hash}\n\n"

# 8 -------------

puts "8) "
puts "1, 3 - returns numbers[0], removes numbers[1], loop restarts on what was numbers[2]"

puts "1, 2 - returns numbers[0], removes numbers[3], returns numbers[1], removes numbers[2]"

puts "\n"

# 9 ------------

words = "the flintstones rock"

word_array = words.split

word_array.each { |word| word.capitalize! }

words = word_array.join(" ")

puts "9) #{words}\n\n"

#10 ------------

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  info["age_group"] = if info["age"] < 17
                        "kid"
                      elsif info["age"] < 64 
                        "adult"
                      else 
                        "senior"
                      end
end

puts "10) #{munsters}"






