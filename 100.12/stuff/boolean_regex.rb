def has_a_b?(string)
  if string =~ /b/
    puts "Match found."
  else
    puts "No match found."
  end
end

has_a_b?("go bucks")
has_a_b?("football")
has_a_b?("disc golf")
has_a_b?("yeah, well, that's just, like, your opinion, man...")