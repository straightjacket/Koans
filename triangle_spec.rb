require 'rspec'

class Triangle
  
    
  def type(a, b, c)
    # WRITE THIS CODE
    if side_has_zero_length(a,b,c) || sum_of_adjacent_sides_less_than_remaining_side(a,b,c)
      raise TriangleError, "not a triangle"
    end

    if ((a == b) && (b == c)) 
      :equilateral
    elsif  ((a == b) || (a == c) || (b == c)) 
      :isosceles
    else
      :scalene
    end
  end
  
  private
  
  def side_has_zero_length a, b, c
    (0 == a || 0 == b || 0 == c)
  end

  def sum_of_adjacent_sides_less_than_remaining_side a, b, c
    (a < 0 || b < 0 || c < 0) || ((a + b) <= c) || ((a + c) <= b) || ((b + c) <= c)
  end

  # Error class used in part 2.  No need to change this code.
  class TriangleError < StandardError
  end
end

describe Triangle do
  before(:each) do
    @triangle = Triangle.new
  end
  
  it  "should have have equal sides if equilateral" do
    @triangle.type(2, 2, 2).should be(:equilateral)
    @triangle.type(10, 10, 10).should be(:equilateral)
  end

  it  "should have exactly 2 equal sides if isosceles" do
    @triangle.type(3, 4, 4).should be(:isosceles)
    @triangle.type(4, 3, 4).should be(:isosceles)
    @triangle.type(4, 4, 3).should be(:isosceles)
    @triangle.type(10, 10, 2).should be(:isosceles)
  end

  it "should have no equal sides if scalene" do
    @triangle.type(3, 4, 5).should be(:scalene)
    @triangle.type(10, 11, 12).should be(:scalene)
    @triangle.type(5, 4, 2).should be(:scalene)
  end

  it "should raise exceptions for illegal triangles" do
    lambda{@triangle.type(0, 0, 0)}.should raise_error(Triangle::TriangleError)
    lambda{@triangle.type(3, 4, -5)}.should raise_error(Triangle::TriangleError)
    lambda{@triangle.type(1, 1, 3)}.should raise_error(Triangle::TriangleError)
    lambda{@triangle.type(2, 4, 2)}.should raise_error(Triangle::TriangleError)
  end
  
end