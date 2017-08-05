class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
    @pointer = -1
  end

  def push(item)
    @pointer += 1
    @top = item
    @stack[@pointer] = @top
  end

  def pop
    temp = @top
    @stack[@pointer] = nil
    @pointer -= 1
    @top = @stack[@pointer]
    return temp
  end

  def empty?
    @top.nil?
  end
end