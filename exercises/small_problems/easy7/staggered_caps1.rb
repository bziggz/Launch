# START
# INPUT a string
# CONVERT every odd index to lowercase, and every even index to uppercase
# RETURN new string
# END

def staggered_case(str)
  ("a".."z").include?(str[0]) ? downcase_first(str) : upcase_first(str)
end

def downcase_first(str)
  new_str = ''
  str.chars.each_with_index do |char, index|
    new_str << if index % 2 == 0 
      char.downcase
    else
      char.upcase
    end
  end

  new_str
end

def upcase_first(str)
  new_str = ''
  str.chars.each_with_index do |char, index|
    new_str << if index % 2 == 0 
      char.upcase
    else
      char.downcase
    end
  end

  new_str
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
