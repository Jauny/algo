# From a dictionary, find all words that are
# x edit distance than the query

def similar(query, dictionary)
  query_permutations = generate_permutations(query)
  similars = []

  query_permutations.each do |perm|
    similars << perm if dictionary.include? perm
  end

  return similars
end

def generate_permutations(query)
  alphabet = ('a'..'z').to_a
  permutations = [query]
  query = query.split('')

  # add letters in between
  query.each_with_index do |el, i|
    alphabet.each do |l|
      permutations << query.clone.insert(i, l).join
    end
  end

  # add letters at the end
  alphabet.each do |l|
    permutations << (query.clone << l).join
  end

  # replace existing letters
  query.each_with_index do |el, i|
    alphabet.each do |l|
      clone = query.clone
      clone[i] = l
      permutations << clone.join
    end
  end

  return permutations.uniq
end
