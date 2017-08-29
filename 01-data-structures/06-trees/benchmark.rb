require 'benchmark'
require_relative 'binary_heap/heap'
require_relative 'binary_heap/node'
require_relative 'binary_tree/binary_search_tree'
require_relative 'binary_tree/node'



arr = []
(1..100000).each do |x|
  arr.push(x)
end


p "Binary Search Tree start"
puts Benchmark.measure {
  root = Node.new(arr[0], arr[0])
  tree = BinarySearchTree.new(root)
  (1..shuffle.size-1).each do |x|
    tree.insert(root, Node.new(arr[x], arr[x]))
  end
  puts "Find 50000th element"
  puts Benchmark.measure {
    tree.find(root, 50000)
    }
  puts "Delete an element"
  puts Benchmark.measure {
    tree.delete(root, 50000)
    }
  }

p "Heap start"
puts Benchmark.measure {
  node = Node.new(arr[0], arr[0])
  heap = Heap.new(root)
  (1...shuffle.size-1).each do |x|
    root = heap.root
    heap.insert(root, Node.new(arr[x], arr[x]))
  end
  puts "Find 50000th element"
  puts Benchmark.measure {
    heap.find(root, 50000)
    }
  puts "Delete an element"
  puts Benchmark.measure {
    heap.delete(root, 50000)
    }
  }