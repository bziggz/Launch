names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(arry)
  arry[rand(arry.size)] # .sample
end

def activity(arry)
  arry[rand(arry.size)] # .sample
end

def sentence(name, activity)
  name + " went " + activity + " today!"
end

puts sentence(name(names), activity(activities))