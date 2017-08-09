require 'benchmark'
require_relative 'linked_list'
require_relative 'node'

arr = []
lList = LinkedList.new
n = 10000
h = 4999



p "Array"
puts Benchmark.measure {
  arr = []
  (0...n).each do |x|
    arr[x] = Node.new(x)
  end
  }

p "Node"
puts Benchmark.measure {
  (0...n).each do |x|
    lList.add_to_tail(Node.new(x))
  end
  }

p "Search for 5000th element of array"
puts Benchmark.measure {
  arr[h]
  }

p "Search for 5000th node"
puts Benchmark.measure {
  node = lList.head
  (1...h).each do |x|
    node = node.next
  end
  }

p "Delete 5000th element of the array elements"
puts Benchmark.measure {
  arr.delete_at(h)
  }

p "Delete 5000th Node"
puts Benchmark.measure {
  node = lList.head
  (1...h).each do |x|
    node = node.next
  end
  lList.delete(node)
  }
