def word_sizes(str)
  size_hash = {}

  str_arr = str.split.map! do |word| 
    word.each_char do |char|
      word.delete!(char) unless char =~ /[a-zA-Z]/
    end

    word.size 
  end

  str_arr.each do |num|
    size_hash.include?(num) ? size_hash[num] += 1 : size_hash[num] = 1
  end

  size_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('')== {}