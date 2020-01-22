# class CircularQueue
#   def initialize(size)
#     @buffer = [nil] * size
#     @oldest = 0
#     @next_spot = 0
#   end

#   def enqueue(val)
#     @oldest = advance_position(@oldest) unless @buffer[@next_spot] == nil
      
#     @buffer[@next_spot] = val
#     @next_spot = advance_position(@next_spot)
#   end

#   def dequeue
#     item = @buffer[@oldest]
#     @buffer[@oldest] = nil
#     @oldest = advance_position(@oldest) unless item == nil
#     item
#   end

#   def advance_position(position)
#     (position + 1) % @buffer.size
#   end
# end

#FURTHER

class CircularQueue
  def initialize(size)
    @buffer = []
    @max_size = size
  end

  def enqueue(val)
    @buffer.shift if @buffer.size == @max_size
    @buffer.push(val)  
  end

  def dequeue
    @buffer.shift
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)

puts queue.dequeue == 1
queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7

puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)

puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)

puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7

puts queue.dequeue == nil


