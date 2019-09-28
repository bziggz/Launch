def xor?(condition1, condition2)
  result =  if condition1 && !condition2
              true
            elsif !condition1 && condition2
              true
            else 
              false
            end
end

p xor?(5.even?, 4.even?) # == true
p xor?(5.odd?, 4.odd?) # == true
p xor?(5.odd?, 4.even?) # == false
p xor?(5.even?, 4.odd?) # == false