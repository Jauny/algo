# This is a bubble sort.
# pass through the data from one end to the other,
# and swap two adjacent elements whenever the first is greater than the last.
# O(n^2)

# non destructive
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
