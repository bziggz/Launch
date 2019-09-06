contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts.each do |name, value|
  contacts[name][:email] = contact_data.first.shift
  contacts[name][:address] = contact_data.first.shift
  contacts[name][:phone] = contact_data.first.shift
  contact_data.shift
end

puts contacts

# fields  =  [:email, :address, :phone]

# contacts.each_with_index do |(name, hash), idx|
#   fields.each do |field|
#     hash[field] = contact_data[idx].shift
#   end
# end

