# Mark Harder
# 2013.01.31
# A Cartesian coordinate with x and y values

class Point
  attr_accessor :x, :y

  def initialize x, y
    @x = x
    @y = y
  end

  def + o
    raise TypeError unless o.is_a?(Point)
    Point.new(@x + o.x, @y + o.y)
  end

  def to_s
    "(#{@x}, #{@y})"
  end

  def eql? o
    self.class.equal?(o.class) &&
      @x == o.x &&
      @y == o.y
  end

  def hash
    "(#{@x}, #{@y})".hash
  end

  alias == eql?

  DIRECTIONS = {
    north: Point.new(0, 1),
    south: Point.new(0, -1),
    west: Point.new(-1, 0),
    east: Point.new(1, 0)
  }
end

