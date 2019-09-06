family = {  uncles: ["bob", "joe", "steve"], 
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immediate = family.select { |relation, name| relation == :brothers || relation == :sisters}
immediate_members = immediate.values.flatten

puts immediate_members
