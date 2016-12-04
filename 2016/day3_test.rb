require "minitest/autorun"
require_relative "day3.rb"

class Day3Test < Minitest::Test
  def test_should_show_not_a_triangle
    check = TriangleChecker.new "5 10 25"

    assert_equal false, check.triangle?
  end
end
