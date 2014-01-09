# Doubly linked list is a data structure in which
# objects are ordered in linear order
# Order is determined by a pointer in each object
# to next object (and another to previous)

class DoublyLinkedList
  Element = Struct.new(:key, :prev, :next)

  attr_accessor :head

  def initialize
    @elements = []
    @head = nil
  end

  def insert(el)
    el = Element.new el
    el.next = @head
    @head.prev = el if @head
    @head = el
    el.prev = nil
    @elements.push el
  end

  def search(k)
    x = @head
    while x && x.key != k
      x = x.next
    end

    x
  end

  def delete(el)
    el.prev ? el.prev.next = el.next : @head = el.next
    el.next.prev = el.prev if el.next
    @elements.delete el
  end
end
