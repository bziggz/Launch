# 1) FALSE - correct
# 2) Did you get it right? - correct
# 3) Alright now! - correct

# 1

'4' == 4 ? puts("TRUE") : puts("FALSE")

# 2

x = 2
   if ((x * 3) / 2) == (4 + 4 - x - 3)
     puts "Did you get it right?"
   else
     puts "Did you?"
   end

# 3

y = 9
   x = 10
   if (x + 1) <= (y)
     puts "Alright."
   elsif (x + 1) >= (y)
     puts "Alright now!"
   elsif (y + 1) == x
     puts "ALRIGHT NOW!"
   else
     puts "Alrighty!"
   end
