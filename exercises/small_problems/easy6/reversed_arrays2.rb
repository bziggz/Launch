# START
# INPUT an array
# CREATE new array with elements of array in reverse order
# OUTPUT new array
# END
# ---MUST retain original array
# ---CANNOT use reverse or reverse!

def new_reverse(arr)
  new_arr = []
  count = 1
  arr.size.times do
    new_arr << arr[-count]
    count += 1
  end
  new_arr
end

def further_reverse_inject(arr)
  arr.reduce([], :unshift)
end

def further_reverse_with_object(arr)
  arr.each_with_object([]) { |el, arr| arr.unshift(el) }
end

a = [1, 2, 3, 4]
b = %w(a b e d c)
c = ["abc"]
d = []

puts a.object_id
aa = new_reverse(a)
p aa
p a
puts aa.object_id
puts a.object_id
puts "\n"

puts b.object_id
bb = new_reverse(b)
p bb
p b
puts bb.object_id
puts b.object_id
puts "\n"

puts c.object_id
cc = new_reverse(c)
p cc
p c
puts cc.object_id
puts c.object_id
puts "\n"

puts d.object_id
dd = new_reverse(d)
p dd
p d
puts dd.object_id
puts d.object_id
puts "\n"

puts "-------------------------\n"

puts a.object_id
aa = further_reverse_inject(a)
p aa
p a
puts aa.object_id
puts a.object_id
puts "\n"

puts b.object_id
bb = further_reverse_inject(b)
p bb
p b
puts bb.object_id
puts b.object_id
puts "\n"

puts c.object_id
cc = further_reverse_inject(c)
p cc
p c
puts cc.object_id
puts c.object_id
puts "\n"

puts d.object_id
dd = further_reverse_inject(d)
p dd
p d
puts dd.object_id
puts d.object_id
puts "\n"

puts "-------------------------\n"

puts a.object_id
aa = further_reverse_with_object(a)
p aa
p a
puts aa.object_id
puts a.object_id
puts "\n"

puts b.object_id
bb = further_reverse_with_object(b)
p bb
p b
puts bb.object_id
puts b.object_id
puts "\n"

puts c.object_id
cc = further_reverse_with_object(c)
p cc
p c
puts cc.object_id
puts c.object_id
puts "\n"

puts d.object_id
dd = further_reverse_with_object(d)
p dd
p d
puts dd.object_id
puts d.object_id
puts "\n"
