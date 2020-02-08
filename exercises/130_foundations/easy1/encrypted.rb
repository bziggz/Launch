KEY = {
  "a" => "n", "b" => "o", "c" => "p", "d" => "q", "e" => "r",
  "f" => "s", "g" => "t", "h" => "u", "i" => "v", "j" => "w",
  "k" => "x", "l" => "y", "m" => "z"
}

def decode(str)
  result = ""

  str.downcase.each_char do |char|
    if KEY[char]
      result << KEY[char]
    elsif KEY.values.include?(char)
      result << KEY.key(char)
    else
      result << char
    end
  end

  str.split('').each_with_index do |char, idx|
    if char.upcase == char
      result[idx] = result[idx].upcase
    end
  end

  result
end

coded_names = [
  "Nqn Ybirynpr",
  "Tenpr Ubccre",
  "Nqryr Tbyqfgvar",
  "Nyna Ghevat",
  "Puneyrf Onoontr",
  "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
  "Wbua Ngnanfbss",
  "Ybvf Unvog",
  "Pynhqr Funaaba",
  "Fgrir Wbof",
  "Ovyy Tngrf",
  "Gvz Orearef-Yrr",
  "Fgrir Jbmavnx",
  "Xbaenq Mhfr",
  "Fve Nagbal Ubner",
  "Zneiva Zvafxl",
  "Lhxvuveb Zngfhzbgb",
  "Unllvz Fybavzfxv",
  "Tregehqr Oynapu"
]

coded_names.each do |name|
  puts decode(name)
end

