require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = Array.new(width) { Array.new(height) }
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x,y)
      matrix[x][y] = pixel
    end
  end

  def at(x, y)
    if inbounds(x, y) 
      return matrix[x][y]
    end
  end

  private

  def inbounds(x, y)
    fits = true
    if x < 0 || x > width-1
      fits = false
    elsif y < 0 || y > height-1
      fits = false
    end
    return fits
  end

end