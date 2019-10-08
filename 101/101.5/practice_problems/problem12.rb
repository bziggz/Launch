arr = [
  [:a, 1], 
  ['b', 'two'], 
  ['sea', {c: 3}], 
  [{a: 1, b: 2, c: 3, d: 4}, 'D']
]

hsh = {}

arr.each do |arr|
  hsh[arr[0]] = arr[1]
end

p hsh

expected_return_value = {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
p expected_return_value
