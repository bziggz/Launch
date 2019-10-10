# START
# INPUT a string

# RETURN a new string with every other alphabetic char up/down
#   disregard non alphabetic chars in pattern
# END

ALPHAS = ("a".."z").to_a + ("A".."Z").to_a

def ignore_staggered_case(str)
  new_str = ''
  count = 0
  str.each_char do |char|
    if ALPHAS.include?(char) && count.odd?
      new_str << char.downcase
      count += 1
    elsif ALPHAS.include?(char) && count.even?
      new_str << char.upcase
      count += 1
    else
      new_str << char
    end
  end

  new_str
end

def staggered_case(str)
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

def staggered_case_choice(str, ignore = 'yes')
  if ignore == 'yes'
    ignore_staggered_case(str)
  else
    staggered_case(str)
  end
end



p staggered_case_choice('I Love Launch School!') #== 'I lOvE lAuNcH sChOoL!'
p staggered_case_choice('I Love Launch School!', 'no') #== 'I lOvE lAuNcH sChOoL!'
p staggered_case_choice('ALL CAPS') #== 'AlL cApS'
p staggered_case_choice('ALL CAPS', 'no') #== 'AlL cApS'
p staggered_case_choice('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 nUmBeRs'
p staggered_case_choice('ignore 77 the 444 numbers', 'no') #== 'IgNoRe 77 ThE 444 nUmBeRs'



