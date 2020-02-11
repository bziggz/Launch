bird_list = %w(raven finch hawk eagle)

def birds(arr)
  yield (arr)
end

birds(bird_list) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(", ")}"
end
