def down_to_zero(start)
  puts start
  if start > 0
    down_to_zero(start - 1)
  end
end

down_to_zero(10)
