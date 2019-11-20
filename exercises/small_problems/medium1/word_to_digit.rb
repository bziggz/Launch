NUM_WORDS = {
  "one" => "1", "two" => "2", "three" => "3", "four" => "4",
  "five" => "5", "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9", "zero" => "0",
}

def alphanumeric?(char)
  ("a".."z").include?(char.downcase) || ("0".."9").include?(char)
end

def word_format(return_arr, input_arr)
  return_arr.map!.with_index do |word, idx|
    alphanumeric?(input_arr[idx][-1]) ? word : word = "#{word}#{input_arr[idx][-1]}"
    input_arr[idx][0] == input_arr[idx][0].upcase ? word.capitalize : word
  end
end

def word_to_digit(str)
  arr = str.split
  trimmed_arr = arr.map do |word| 
    word.chars.select { |char| alphanumeric?(char) }.join("").downcase
  end

  new_num_count = 0
  nums_to_trim = []
  start_index = nil
  trimmed_arr.map!.with_index do |word, idx|
    if NUM_WORDS.keys.include?(word) && alphanumeric?(arr[idx][-1])
      start_index = idx if start_index.nil?
      new_num_count += 1
      word = NUM_WORDS[word]
    elsif NUM_WORDS.keys.include?(word) && !alphanumeric?(arr[idx][-1])
      new_num_count += 1
      nums_to_trim << [start_index, new_num_count]
      start_index = nil
      new_num_count = 0
      word = NUM_WORDS[word]
    else
      nums_to_trim << [start_index, new_num_count]
      start_index = nil
      new_num_count = 0
      word
    end   
  end

  word_format(trimmed_arr, arr)

  format_string_nums(trimmed_arr, nums_to_trim).join(" ")
end

def format_string_nums(input_arr, count_arr)
  count_arr.delete_if { |count| count[0] == nil }

  count_arr.sort_by { |count| count[0] }.reverse.each do |counts|
    if counts[1] == 10
      input_arr[counts[0], counts[1]] = "(#{input_arr[counts[0], 3].join("")}) #{input_arr[counts[0] + 3, 3].join("")}-#{input_arr[counts[0] + 6, 4].join("")}"
    elsif counts[1] == 7
      input_arr[counts[0], counts[1]] = "#{input_arr[counts[0], 3].join("")}-#{input_arr[counts[0] + 3, 4].join("")}"
    else
      input_arr[counts[0], counts[1]] = input_arr[counts[0], counts[1]].join("")
    end
  end

  input_arr
end

p word_to_digit('Please call me at seven one four five five four one two three four. Five four three Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'






