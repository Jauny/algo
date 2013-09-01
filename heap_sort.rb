# Heap sort
# Uses a heap to sort the data
# Puts all the data in the heap, then pops heap's root and puts it in the array
# Until the heap is empty

# Ruby's awesomeness: no heap built in, so let's hack one quickly
# Might be the worst heap class, but will do here;
# The goal is to write a heap sort, not the heap itself.
class Heap
  include Enumerable

  def initialize
    @data = []
  end

  def <<(el)
    @data << el
    @data.sort!
  end

  def pop
    @data.shift
  end

  def each(&block)
    @data.each do |datum|
      block.call(datum)
    end
  end

  def to_s
    @data
  end
end


# Now to the heap sort algorithm!
# big O(n log n)

# destructive
def heap_sort!(data)
  h = Heap.new
  while data.any?
    h << data.pop
  end

  while h.any?
    data << h.pop
  end

  return data
end

# non-destructive
def heap_sort(data)
  h = Heap.new
  data.each do |datum|
    h << datum
  end

  sorted_data = []
  while h.any?
    sorted_data << h.pop
  end

  return sorted_data
end


# tests
array1 = [1,2,3,4]
puts "Array #{array1} should stay sorted."
puts heap_sort(array1) == array1
puts "---"

array2 = [4,3,2,1]
puts "Array #{array2} should be sorted."
puts heap_sort(array2) == [1,2,3,4]
puts "---"

array3 = [2352345, 54453532, 45646546, 767889867, 896754, 433, 2342342, 333]
puts "Array #{array3} should be sorted."
puts heap_sort(array3) == [333, 433, 896754, 2342342, 2352345, 45646546, 54453532, 767889867]
puts "---"

array4 = []
1000.times { array4 << rand(1000) }
puts "Array4 #{array4} should be sorted."
puts heap_sort(array4) == array4.sort
