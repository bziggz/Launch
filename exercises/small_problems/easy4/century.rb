def suffix(year)
    if year % 100 == 11 || year % 100 == 12 || year % 100 == 13
      return "th"
    end

    case year % 10  
    when 1 then "st"
    when 2 then "nd"
    when 3 then "rd"
    else 
      "th"
    end
end

def century(year)
  cent = year % 100 == 0 ? year / 100 : year / 100 + 1

  sfx = suffix(cent)

  cent.to_s + sfx
end

p century(2000) #== '20th'
p century(2001) #== '21st'
p century(1965) #== '20th'
p century(256) #== '3rd'
p century(5) #== '1st'
p century(10103) #== '102nd'
p century(1052) #== '11th'
p century(1127) #== '12th'
p century(11201) #== '113th'
