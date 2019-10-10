# START
# INPUT a string
# CREATE a hash to be returned
# COUNT number of lowercase, uppercase, and non-letter chars
# POPULATE hash with counts (:item => count)
# RETURN hash
# END

def letter_case_count(str)
  hsh = { lowercase: 0, uppercase: 0, neither: 0 }

  str.each_char do |char|
    if ('a'..'z').include?(char)
      hsh[:lowercase] += 1
    elsif ('A'..'Z').include?(char)
      hsh[:uppercase] += 1
    else
      hsh[:neither] += 1
    end
  end

  hsh
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

