require_relative 'selection_sort'

def bucket_sort(arr, bucket_size = 5)
  if arr.empty? || arr.length == 1
    return arr
  end
  
  min = arr.min
  
  #creating space for elements to be pushed into
  buckets = []
  (0..arr.length - 1).each do |i|
    buckets[i] = []
  end

  #pushing unsorted elements into the buckets
  (0..buckets.length - 1).each do |i| 
    buckets[((arr[i] - min) / bucket_size).floor].push(arr[i])
  end

  # creating an array to push elements into as they are sorted
  sortingArray = []
  (0..buckets.length - 1).each do |i|
    selection_sort(buckets[i])
    buckets[i].each do |value|
      sortingArray.push(value)
    end
  end
  sortingArray
end