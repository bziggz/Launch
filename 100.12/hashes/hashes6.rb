words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']


words_sorted = []
anagrams = []
index_arrays = []
sorted_word_hash = {}

words.each { |word| words_sorted.push(word.chars.sort) }
words.each { |word| sorted_word_hash[words.index(word)] = word.chars.sort }

words_sorted.each do |sorted_word|
  if (anagrams.include?(sorted_word) == false)
    anagrams.push(sorted_word)
  elsif anagrams.include?(sorted_word)
    next
  end
end

anagrams.each do |word|
  same_word_hash = sorted_word_hash.select { |k, v| v == word }
  index_arrays.push(same_word_hash.keys)
end

index_arrays.each do |arr|
  word_array = []
  arr.each do |ind|
    word_array.push(words[ind])
  end
  puts word_array.to_s
end



result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "-----"
  p v
end



