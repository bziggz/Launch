hsh = {
  first: ['the', 'quick'], 
  second: ['brown', 'fox'], 
  third: ['jumped'], 
  fourth: ['over', 'the', 'lazy', 'dog']
}

hsh.each_value do |value|
  value.each do |word|
    word.each_char do |char|
      if %w(a e i o u).include?(char)
        puts char
      end
    end
  end
end
