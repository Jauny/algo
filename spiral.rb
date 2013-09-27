# Generate and prints a spiraled matrix n*n
# http://rosettacode.org/wiki/Spiral_matrix#Ruby

def spiral(n)
  spiral = Array.new(n) {Array.new(n, nil)}     # n x n array of nils
  runs = n.downto(0).each_cons(2).to_a.flatten  # n==5; [5,4,4,3,3,2,2,1,1,0]
  delta = [[1,0], [0,1], [-1,0], [0,-1]].cycle
  x, y, value = -1, 0, -1
  for run in runs
    dx,dy = delta.next
    run.times do |i|
      x += dx
      y += dy
      value += 1
      spiral[y][x] = value
    end
  end
  spiral
end

def print_matrix(m)
  max = m.flatten.map{|x| x.to_s.size}.max
  m.each {|row| puts row.map {|x| "%#{max}s " % x}.join}
end

print_matrix spiral(5)

#  0  1  2  3 4
# 15 16 17 18 5
# 14 23 24 19 6
# 13 22 21 20 7
# 12 11 10  9 8

##############################
# Refactor, thanks Mr. Farmer!
# Takes an array = [[1,2,3],
#                   [8,9,4],
#                   [7,6,5]]
def spiral(array)
  return [] if array.empty?

  first, *rest = *array

  return first + spiral(rest.transpose.reverse)
end
