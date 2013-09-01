# This is a bubble sort.
# pass through the data from one end to the other,
# and swap two adjacent elements whenever the first is greater than the last.
# O(n^2)

# non-destructive
def bubble_sort(array)
  clone = array.clone
  clone.length.times do |i|
    (clone.length - 1).times do |j|
      if clone[j] > clone[j+1]
        clone[j], clone[j+1] = clone[j+1], clone[j]
      end
    end
  end
  clone
end

# destructive
def bubble_sort!(array)
  array.length.times do |i|
    (array.length - 1).times do |j|
      if array[j] > array[j+1]
        array[j], array[j+1] = array[j+1], array[j]
      end
    end
  end
  array
end

# tests
array1 = [1,2,3,4]
puts "Array #{array1} should stay sorted."
puts bubble_sort(array1) == array1
puts "---"

array2 = [4,3,2,1]
puts "Array #{array2} should be sorted."
puts bubble_sort(array2) == [1,2,3,4]
puts "---"

array3 = [2352345, 54453532, 45646546, 767889867, 896754, 433, 2342342, 333]
puts "Array #{array3} should be sorted."
puts bubble_sort(array3) == [333, 433, 896754, 2342342, 2352345, 45646546, 54453532, 767889867]
puts "---"

array4 = []
1000.times { array4 << rand(1000) }
puts "Array4 #{array4} should be sorted."
puts bubble_sort(array4) == array4.sort
