def lab_check(string)
  if string =~ /lab/
    puts string
  else
    puts "Not in there"
  end
end

lab_check("laboratory")
lab_check("experiment")
lab_check("Pans Labyrinth")
lab_check("elaborate")
lab_check("polar bear")
    

