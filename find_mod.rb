# return the mod in a list

def mod(list)
  hash = Hash.new(0)

  list.each do |el|
    hash[el] += 1
  end

  val, max = 0, 0
  hash.each do |el, count|
    val, max = el, count if count > max
  end

  return [val, max]
end
