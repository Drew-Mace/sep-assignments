require 'benchmark'
require_relative 'quick_sort'
require_relative 'heap_sort'
require_relative 'bucket_sort'
require_relative 'bubble_sort'
require_relative 'insertion_sort'
require_relative 'selection_sort'
require_relative 'merge_sort'

array = Array.new(50) { rand(0...50)}

p "Quick Sort"
puts Benchmark.measure {
  quicksort(array)
  p array
  }

p "Heap Sort"
puts Benchmark.measure {
  s = HeapSort.new array
  s.sort
  p array
  }

p "Bucket Sort"
puts Benchmark.measure {
  bucket_sort(array)
  p array
  }

p "Bubble Sort" 
puts Benchmark.measure {
  bubble_sort(array)
  p array
  }

p "Insertion Sort"
puts Benchmark.measure {
  insertion_sort(array)
  p array
  }

p "Selection Sort"
puts Benchmark.measure {
  selection_sort(array)
  p array
  }

p "Merge Sort"
puts Benchmark.measure {
  merge_sort(array)
  p array
  }