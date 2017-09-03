def binary_search_recursive(collection, value)
  low = 1
  high = collection.length - 1
  if low >= high
    return false
  end
  mid = (low + high) / 2
  if collection[mid] == value
    mid
  elsif collection[mid] < value
    binary_search_recursive(collection[(mid+1)..high], value)
  else
    binary_search_recursive(collection[low..mid], value)
    return collection[value]
  end
  return "Value not found"
end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

puts binary_search_recursive(array, 7)
puts binary_search_recursive(array, 43)