=begin
  GIVEN an array and a hash
    array - 2+ elements, each element a part f a person's name
    hash - 2 kv pairs, keys: title and occupation
  RETURN a string that greets the person using their full name and title
=end

def greetings(name, job)
  "Hello, #{name.join(' ')}! Nice to have a #{job.values.join(' ')} around!"
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })