ALPHAS = ("a".."z").to_a + ("A".."Z").to_a

def cleanup(str)
  subbed_string = str.gsub!(/[^a-zA-Z]/, " ")
  final_string = subbed_string.split(" ").join(" ")

  final_string = " " + final_string if subbed_string[0] == " " 
  final_string = final_string + " " if subbed_string[-1] == " "
end

def simpler_cleanup(str)
  str.gsub!(/[^a-zA-Z]+/, " ")
end

def further_cleanup(str)
  new_str = ""
  str.each_char do |char|
    if ALPHAS.include?(char)
      new_str << char
    else
      new_str << " "
    end
  end

  new_str.squeeze(" ")
end

p cleanup("---what's my +*& line?") #== ' what s my line '

p simpler_cleanup("---what's my +*& line?")

p further_cleanup("---what's my +*& line?")