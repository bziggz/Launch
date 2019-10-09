# START
# INPUT an array
# REVERSE order of elements
  # remove last item
  # insert item back into array at appropriate location
# RETURN reversed array
# END
# --CANNOT use reverse or reverse!
# --MUST maintain object id

def list_reverser(arr)
  count = 0
  arr.size.times do 
    arr.insert(count, arr.pop)
    count += 1
  end
  arr
end

a = [1, 2, 3, 4]
b = %w(a b e d c)
c = ["abc"]
d = []

puts a.object_id
p list_reverser(a)
puts a.object_id
puts "\n"

puts b.object_id
p list_reverser(b)
puts b.object_id
puts "\n"

puts c.object_id
p list_reverser(c)
puts c.object_id
puts "\n"

puts d.object_id
p list_reverser(d)
puts d.object_id
puts "\n"
