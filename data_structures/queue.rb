# Queue is a dynamic set retrieving elements
# following first-in first-out (FIFO)

class Queue # Doesn't inherit from array/enum on purpose
  def initialize
    @elements = []
  end

  def enqueue(el)
    @elements.push el
  end

  def dequeue
    @elements.shift
  end

  def head
    @elements.first
  end

  def tail
    @elements.last
  end

  def empty?
    @elements.empty?
  end
end
