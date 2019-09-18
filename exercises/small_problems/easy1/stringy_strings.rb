def stringy(int, start = 1)
  count = start
  string = ""

  until count >= int + start
    string << (count % 2).to_s
    count += 1 
  end

  string
end

puts stringy(6) #== '101010'
puts stringy(9) #== '101010101'
puts stringy(4) #== '1010'
puts stringy(7) #== '1010101'
