def ascii_value(string)
  arr = string.split("")
  arr.map! { |char| char.ord }
  arr.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

p "p".ord.chr