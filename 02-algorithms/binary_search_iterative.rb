def binary_search_iterative(collection, value)
  low = 0
  high = collection.length - 1
  
  while low <= high
    mid = (low + high) / 2
    if collection[mid] > value 
      high = mid - 1
    elsif collection[mid] < value
      low = mid + 1
    else 
      return mid
    end
  end
  return "Value not found"
end

collection = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

puts binary_search_iterative(collection, 11)
puts binary_search_iterative(collection, 29)