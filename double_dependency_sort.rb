# Given two sets of dependencies, sort the tasks.
# eg.
# dependency_first = [2,5,3]
# dependency_second = [4,1,2]
# tasks = [1,2,3,4,5,6]
# result = [3,2,5,1,4]
# dependency_first[i] must be before dependency_second[i]

class DoubleDepSort
  def sort_tasks(dep_first, dep_second, num_of_tasks)
    tasks = (1..num_of_tasks).to_a
    pairs = dep_first.zip(dep_second)
    dependencies_hash = {}
    pairs.each do |a, b|
      dependencies_hash[a] ||= []
      dependencies_hash[a] << b
    end

    puts "sorting #{tasks} with #{dependencies_hash}..."

    tasks.sort! do |a,b|
      compare(a, b, dependencies_hash)
    end

    return "tasks sorted: #{tasks}"
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
