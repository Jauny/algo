## Hash-based Search

* Efficient search algo
* Accepts bigger collections than sequential search
* Does not need sorted list like binary search

### Complexity
* __Best__    O(1)
* __Average__ O(1)
* __Worst__   O(n)

### Algorithm
#### Date
* a collection c
* a hash table a
* a hashing function to_hash()
* an searched element t


#### 1. Write a hashing function
```ruby
def to_hash(el)
  return el % 3
end
```

#### 2. Generate hash table
```ruby
def generate_table(c)
  a = Hash.new

  c.each do |el|
    h = to_hash(el)
    a[h] = Array.new if a[h].nil?

    a[h] << el
  end

  return a
end
```

#### 3. Check existence of t in c
```ruby
def hash_based_search(a, t)
  h = to_hash(t)
  bin = a[h]

  sequential_search(bin, t)
end
```

_Here, sequetial search is used on the corresponding bin because the number of values is normally small enough._
