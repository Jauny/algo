# Given two sets of dependencies, sort the tasks.
# eg.
# dependency_first = [2,5,3]
# dependency_second = [4,1,2]
# tasks = [1,2,3,4,5,6]
# result = [3,2,5,1,4]
# dependency_first[i] must be before dependency_second[i]

class DoubleDepSort
  class << self
    def sort_tasks(dep_first, dep_second, num_of_tasks)
      tasks = (1..num_of_tasks).to_a
      pairs = dep_first.zip(dep_second)
      dependencies_hash = {}
      pairs.each do |a, b|
        dependencies_hash[a] ||= []
        dependencies_hash[a] << b
      end

      new_tasks = tasks.sort do |a,b|
        compare(a, b, dependencies_hash)
      end
    end

    private
    def compare(a, b, hash)
      if hash[a] && hash[a].include?(b)
        return -1
      else
        return 1
      end
    end
  end
end

# tests
dep_first = [3, 6, 8]
dep_second = [4, 7, 9]

puts "dep_first: #{dep_first}"
puts "dep_second: #{dep_second}"

result = DoubleDepSort::sort_tasks(dep_first, dep_second, 10)
p result
