# START
# INPUT array of strings
# FOR EACH string in array
#     REMOVE remove vowels
# OUTPUT new array sans vowels 
# END

def remove_vowels(arr)
  arr.map! do |str|
    str.delete("AEIOUaeiou")
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) #== %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) #== %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) #== ['BC', '', 'XYZ']