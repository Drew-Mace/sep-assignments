require_relative 'node'

class OpenAddressing
  def initialize(size)
    @hash = Array.new(size)
    @cubby = size
  end

  def []=(key, value)
    i = index(key, size())
    if @hash[i].nil?
      @hash[i] = Node.new(key, value)
      @cubby += 1
    elsif @hash[i].key == key && @hash[i].value == value
      return "item already exists!"
    elsif
      x = next_open_index(i)
      if x == -1
        resize()
        self[key] = value
      else
        @hash[x] = Node.new(key, value)
      end
    end
  end

  def [](key)
    (0...size()).each do |i|
      if @hash[i] != nil
        if @hash[i].key == key
          return @hash[i].value
        end
      end
    end
    return nil
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    (index...size()).each do |i|
      if @hash[i].nil?
        return i
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    return @hash.length
  end
  
  def printHash
    (0...size()).each do |i|
      if @hash[i]
        puts "hash index: #{i} key: #{@hash[i].key} = #{@hash[i].value}"
      end
    end
    puts "The Load factor is #{load()}"
  end
  
  def load
    size = size() + 0.0
    factor = @cubby / size
    return factor
  end

  # Resize the hash
  def resize
    temp = Array.new(@hash.length * 2)
    (0...temp.length).each do |i|
      if @hash[i] 
        tempIndex = @hash[i].key.sum % @hash.length
        temp[tempIndex] = @hash[i]
      end
    end
    @hash = temp
  end
end