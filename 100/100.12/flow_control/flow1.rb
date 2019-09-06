# 1-F, 2-F, 3-F, 4-T, 5-T

def t_or_f(num, boo)
  if boo
    puts num.to_s + " True"
  else
    puts num.to_s + " False"
  end
end

t_or_f(1, (32 * 4) >= 129)
t_or_f(2, false != !true)
t_or_f(3, true = 4)
t_or_f(4, false == (847 == '874'))
t_or_f(5, (!true || (!(100 / 5) == 20) || ((328 / 4) == 82 )) || false)

