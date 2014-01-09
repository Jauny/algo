# Stack is a dynamic set retrieving elements
# following last-in first-out (LIFO)

class Stack # Doesn't inherit from array/enum on purpose
  def initialize
    @elements = []
  end

  def push(el)
    @elements.push el
  end

  def pop
    @elements.pop
  end

  def top
    @elements.last
  end

  def empty?
    @elements.empty?
  end
end
