require "minitest/autorun"
require_relative "day5.rb"

class Day5Test < Minitest::Test
  def test_should_find_password
    pass_gen = PasswordGenerator.new "abc"

    assert_equal "18f47a30", pass_gen.password
  end
end
