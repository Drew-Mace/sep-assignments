require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
  attr_accessor :cubby

  def initialize(size)
    @max_load_factor = 0.7
    @cubby = 0.0
    @hash = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size())
    if @hash[i].nil?
      @hash[i] = LinkedList.new
      @hash[i].add_to_front(Node.new(key, value))
      @cubby += 1
    else
      pointer = @hash[i].head
      until pointer == nil || pointer.key == key
        pointer = pointer.next
      end
      if pointer.nil?
        @hash[i].add_to_front(Node.new(key, value))
        @cubby += 1
      elsif pointer.key == key && pointer.value != value
        pointer.value = value
      else
        return "item already exists"
      end
    end
    if load_factor() > @max_load_factor
      resize()
    end
  end

  def [](key)
    i = index(key, size())
    if @hash[i]
      pointer = @hash[i].head
      until pointer == nil || pointer.key == key
        pointer = pointer.next
      end
      if pointer.nil?
        return "pair doesnt exist"
      else 
        return pointer.value
      end
    else 
      return "Something went wrong and value was not copied"
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end
  
  def hashItOut
    (0...size()).each do |i|
      if @hash[i]
        puts "index #{i}"
        @hash[i].print
      end
    end
    puts "The Load Factor is #{load_factor()}"
  end

  # Calculate the current load factor
  def load_factor
    size = size() + 0.0
    factor = @cubby / size
    return factor
  end

  # Simple method to return the number of items in the hash
  def size
    return @hash.length
  end

  # Resize the hash
  def resize
    temp = Array.new(@hash.length * 2)
    (0...@hash.length).each do |i|
      if @hash[i]
        pointer = @hash[i].head
        until pointer == nil
          tempIndex = pointer.key.sum % temp.length
          temp[tempIndex] = LinkedList.new
          temp[tempIndex].add_to_front(pointer)
          pointer = pointer.next
        end
      end
    end
    @hash = temp
  end
end
