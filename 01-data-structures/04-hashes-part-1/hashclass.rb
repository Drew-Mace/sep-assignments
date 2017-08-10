class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size())
    if @items[i].nil?
      @items[i] = HashItem.new(key, value)
    elsif @items[i].key == key && @items[i].value == value
      return "Item already exists."
    else
      loop do
        # call resize until space for new element
        resize()
        r = index(key, size())
        break if @items[r].nil? || @items[r].key == key
      end
      x = index(key, size())
      if @items[x].nil?
        @items[x] = HashItem.new(key, value)
      else
        @items[x].value = value
      end
    end
  end


  def [](key)
    i = index(key, size())
    if @items[i]
      return @items[i].value
    end
  end

  def resize
    # doubling size
    temp = Array.new(@items.length * 2) 
    (0...@items.length).each do |x|
      if @items[x]
        tempIndex = @items[x].key.sum % temp.length
        temp[tempIndex] = @items[x]
        @items[x] = nil
      end
    end
    @items = temp
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

end