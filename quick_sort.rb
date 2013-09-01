# Quick sort
# Takes a mid point
# Divide data into small values and high values
# recursively quick sort each new array

# non-destructive
def quick_sort(array)
  return array if array.length <= 1

  middle = array[array.length / 2]
  left, right = [], []

  array.each_with_index do |el, i|
    unless i == array.length / 2
      if el <= middle
        left << el
      else
        right << el
      end
    end
  end

  return [quick_sort(left), middle, quick_sort(right)].flatten!
end

# tests
array1 = [1,2,3,4]
puts "Array #{array1} should stay sorted."
puts quick_sort(array1) == array1
puts "---"

array2 = [4,3,2,1]
puts "Array #{array2} should be sorted."
puts quick_sort(array2) == [1,2,3,4]
puts "---"

array3 = [2352345, 54453532, 45646546, 767889867, 896754, 433, 2342342, 333]
puts "Array #{array3} should be sorted."
puts quick_sort(array3) == [333, 433, 896754, 2342342, 2352345, 45646546, 54453532, 767889867]
puts "---"

array4 = []
1000.times { array4 << rand(1000) }
puts "Array4 #{array4} should be sorted."
puts quick_sort(array4) == array4.sort
