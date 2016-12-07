require "minitest/autorun"
require_relative "day6.rb"

class Day6Test < Minitest::Test

  def test_should_store_letters_in_arrays_by_column
    input = File.open("day6_test_input.txt").read
    code_breaker = CodeBreaker.new input
    expected = ["e", "d", "e", "r", "a", "t", "s", "r", "n", "n", "s", "t", "v", "v", "d", "e"]

    assert_equal expected, code_breaker.letter_hash["column_0"]
  end

  def test_should_find_message
    input = File.open("day6_test_input.txt").read
    code_breaker = CodeBreaker.new input

    assert_equal "easter", code_breaker.message
  end
end
