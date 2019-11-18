def maskify(string)
  string.length <= 4 ? 
    string : '#' * (string.length - 4) + string[-4..-1]
end


p maskify('4556364607935616')