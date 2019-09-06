def take_block(num, &block)
  block.call(num)
end

num = 42
take_block(num) do  |num|
  puts "Block being called in this method! #{num}"
end