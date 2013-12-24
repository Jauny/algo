# This is a binary search
# From an ordered collection,
# it devides the collection in halves until find the element

# Best is t is the middle element, O(1)
# Average and worst are O(log n) (divides by half each time)

# Divide and Conquer is used

def binary_search(collection, t)
  low = 0
  high = collection.length - 1

  while low <= high
    mid = (low + high) / 2

    if collection[mid] == t
      puts "element t (#{t}) is at index #{mid}"
      return true
    elsif collection[mid] < t
      low = mid + 1
    elsif collection[mid] > t
      high = mid - 1
    end
  end

  return false
end

# tests
collection1 = (1..1000).to_a
puts binary_search(collection1, 250) == true
puts binary_search(collection1, 2450) == false

collection2 = (1000..100000).to_a
puts binary_search(collection2, 250) == false
puts binary_search(collection2, 253450) == false
puts binary_search(collection2, 250) == false
puts binary_search(collection2, 3746) == true
