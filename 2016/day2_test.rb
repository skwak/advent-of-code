require "minitest/autorun"
require_relative "day2.rb"

class Day2Test < Minitest::Test
  def test_should_instantiate_code_breaker
    code_sleuth = CodeBreaker.new "RLDU"
    assert true, code_sleuth
  end

  def test_should_find_final_keypad_location
    code_sleuth = CodeBreaker.new "RLUDDD"

    assert_equal 8, code_sleuth.keypad_location
  end

  def test_should_find_key_in_code_with_new_line
    code = "RLUDDD
            R"
    code_sleuth = CodeBreaker.new code

    assert_equal "89", code_sleuth.key
  end

end
