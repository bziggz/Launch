# GIVEN name string ("First Last")
# RETURN string ("Last, First")

def swap_name(name)
  parts = name.split
  parts[1] + ", " + parts[0] 
end
  
p swap_name('Joe Roberts') == 'Roberts, Joe'