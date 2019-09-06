status = ["awake", "tired"].sample

instructions = if status == "awake"
  "Be productive!"
else 
  "Go to sleep!"
end

puts instructions