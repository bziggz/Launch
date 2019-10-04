def word_sizes(str)
  size_hash = {}
  str_arr = str.split.map! { |word| word.size }

  str_arr.each do |num|
    size_hash.include?(num) ? size_hash[num] += 1 : size_hash[num] = 1
  end

  size_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}