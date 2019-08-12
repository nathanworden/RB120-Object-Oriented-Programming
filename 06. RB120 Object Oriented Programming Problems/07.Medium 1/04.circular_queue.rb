require 'pry'

class CircularQueue
  attr_accessor :buffer, :insert_idx, :remove_idx

  def initialize(buffer_size)
    @buffer = Array.new(buffer_size)
    @insert_idx = 0
    @remove_idx = 0
  end

  def enqueue(num)
    self.dequeue if buffer[self.insert_idx]
    buffer[self.insert_idx] = num 
    if self.insert_idx == buffer.size - 1
      self.insert_idx = 0
    else
      self.insert_idx += 1
    end
  end

  def dequeue
    removed = buffer.delete_at(self.remove_idx)
    buffer.insert(self.remove_idx, nil)
    if self.remove_idx == buffer.size - 1
      self.remove_idx = 0
    else
      self.remove_idx += 1 unless removed == nil
    end
    removed
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
