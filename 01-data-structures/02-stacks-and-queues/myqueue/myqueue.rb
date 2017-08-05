class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[0]
    @tailNum = -1
  end

  def enqueue(element)
    @tailNum += 1
    @queue[@tailNum] = element
    @head = @queue[0]
    @tail = @queue[@tailNum]
  end

  def dequeue
    temp = @head
    (0...@queue.length-1).each do |i|
      @queue[i] = @queue[i+1]
    end
    @queue[@tailNum] = nil
    @head = @queue[0]
    @tailNum -= 1
    if @tailNum < 0
      @head = nil
      @tail = nil
    else
      @tail = @queue[@tailNum]
    end
    return temp
  end

  def empty?
    if @head === nil
    return true
    else 
      return false
    end
  end
end