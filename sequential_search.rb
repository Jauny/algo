# This is a Sequential Search.
# Sequential search is the most basic search algorithm
# To look for an element t in a collection C,
# it simply iterate over C and compare each element e to t.
# Returns true when e == t, false either way.

# Best case is t is the first element
# with O(1)
# And average/worst case is O(n) (1/2n + 1/2)

def sequential_search(collection, t)
  collection.each do |e|
    return true if e == t
  end

  return false
end


# tests
collection1 = (1..1000).to_a.shuffle
puts sequential_search(collection1, 250) == true
puts sequential_search(collection1, 2450) == false

collection2 = (1000..100000).to_a.shuffle
puts sequential_search(collection2, 250) == false
puts sequential_search(collection2, 253450) == false
puts sequential_search(collection2, 250) == false
puts sequential_search(collection2, 3746) == true
