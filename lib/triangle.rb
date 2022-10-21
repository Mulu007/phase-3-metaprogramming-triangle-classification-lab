class Triangle
  attr_accessor :sides

  @sides = []

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    # sorts the sides array from the smallest to the largest 
    # the exclamation mark permanently changes the original array when it's sorted
    @sides.sort!
  end

  def kind
    # if any of the sides is less than 0 or the sum of the lengths of any two sides of a triangle doesn't exceed the length of the third side raise error
    if @sides.any? { |sides| sides <= 0} || ((@sides[0] + @sides[1] <= @sides[2]))
    raise TriangleError
    # else if the number of the unique sides (ie all sides are equal) return equilateral
    elsif @sides.uniq.size == 1 
      :equilateral
    # else if the number of the unique sides are only two (eg 6 by 6 by 4) return isosceles
    elsif @sides.uniq.size == 2
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end

end
