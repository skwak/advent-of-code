class TriangleChecker
  def initialize sides
    @sides = sides.split(" ")
    @side_a = @sides[0].to_i
    @side_b = @sides[1].to_i
    @side_c = @sides[2].to_i
  end

  def triangle?
    if (@side_a + @side_b <= @side_c) || (@side_a + @side_c <= @side_b) || (@side_b + @side_c <= @side_a)
      false
    else
      true
    end
  end
end

text = File.open("day3_input.txt").read
real_triangle_count= 0
text.each_line do |line|
  checker = TriangleChecker.new line
  real_triangle_count += 1 if checker.triangle?
end

puts "There are #{real_triangle_count} real triangles."
