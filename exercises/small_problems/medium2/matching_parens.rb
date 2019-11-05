=begin 

SOURCE:

EXTRACT PROBLEM 

INPUT
  a string with parentheses

EXAMPLE
  balanced?('What (is) this?') == true
  balanced?('What is) this?') == false
  balanced?('What (is this?') == false
  balanced?('((What) (is this))?') == true
  balanced?('((What)) (is this))?') == false
  balanced?('Hey!') == true
  balanced?(')Hey!(') == false
  balanced?('What ((is))) up(') == false

OUTPUT
  boolean - TRUE if all parentheses are balanced: ( has a corresponding )

EXPERIMENT / EDGE
  parentheses contained in each other
  ) appearing before (

ALGO 
  GIVEN a string
  CREATE a count = 0
  ITERATE THROUGH EACH CHAR
    count += 1 for every (
    count -= 1 for every )
    break if count < 0 (means ) came first)

  RETURN true if count = 0
=end

def quote_count?(str)
  str.count("'").even? && str.count('"').even?
end

def balanced?(str)
  count = 0

  str.each_char do |char|
    count += 1 if [ "(", "{", "[", "<"].include?(char)
    count -= 1 if [ ")", "}", "]", ">"].include?(char)
    break if count < 0
  end

  count.zero? && quote_count?(str)
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false