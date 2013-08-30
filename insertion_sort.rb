# Insertion sort work really well for almost sorted list
# Finds next element that needs to be sorted
# and puts it where it belongs among already sorted elements.

# destructive
def insertion_sort!(array)
  array.each_with_index do |el, i|
    j = i
    j -= 1 while j > 0 && el < array[j-1]
    array[i] = array[i-1] and i -= 1 while i > j
    array[j] = el
  end

  array
end

# non-destructive
def insertion_sort(array)
  clone = array.clone
  clone.each_with_index do |el, i|
    j = i
    j -= 1 while j > 0 && el < clone[j-1]
    clone[i] = clone[i-1] and i -= 1 while i > j
    clone[j] = el
  end

  clone
end

# tests
array1 = [1,2,3,4]
puts "Array #{array1} should stay sorted."
puts insertion_sort(array1) == array1
puts "---"

array2 = [4,3,2,1]
puts "Array #{array2} should be sorted."
puts insertion_sort(array2) == [1,2,3,4]
puts "---"

array3 = [2352345, 54453532, 45646546, 767889867, 896754, 433, 2342342, 333]
puts "Array #{array3} should be sorted."
puts insertion_sort(array3) == [333, 433, 896754, 2342342, 2352345, 45646546, 54453532, 767889867]
