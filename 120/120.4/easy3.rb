# 1) case 1 - "Hello"
# case 2 - NoMethodError
# case 3 - ArgumentError
# case 4 - "Goodbye"
# case 5 - NoMethodError

# 2) new method: 
# def self.hi
#   greeting = Greeting.new
#   greeting.greet("Hello") 
# end

# 3) cat1 = AngryCat.new(3, "mittens"), cat2 = AngryCat.new(4, "bob")

# 4) def to_s; "I am a #{@type} cat."; end

# 5) lines 3 + 5 would execute. lines 2 + 6 would return NoMethodError

# 6) replace self with @

# 7) attr_accessor, and explicit return