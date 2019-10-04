#different, because the split method creates a new object

a = "hello world"

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

p a.object_id
p spin_me(a).object_id