

def commanator(num)
  commas = ""
  counter = 0
  num_string = num.to_s.reverse

  if num_string =~ /\./
    until num_string[2] == "\."
      num_string = "0" + num_string
    end
  end

  while counter < num_string.length
    if num_string =~ /\./ && [6, 9, 12, 15, 18].include?(counter)
      commas << ",#{num_string[counter]}"
    elsif !(num_string =~ /\./) && [3, 6, 9, 12, 15].include?(counter)        
      commas << ",#{num_string[counter]}" 
    else
      commas << num_string[counter]
    end
    counter += 1
  end

  commas.reverse!
end

puts commanator(123413.12)