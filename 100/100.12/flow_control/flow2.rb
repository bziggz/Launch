def upcasenator(str)
  if str.length > 10
    upcased_string = str.upcase!
    return upcased_string
  else
    return "String not long enough."
  end
end

puts upcasenator("What's up, meatbags?")

