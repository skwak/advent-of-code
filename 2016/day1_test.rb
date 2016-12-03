require "minitest/autorun"
require_relative "day1.rb"

class Day1Test < Minitest::Test
  def test_should_instantiate_wise_person_with_direction
    smart_person = WisePerson.new
    assert_equal "North", smart_person.direction
  end

  def test_should_change_direction_if_command_changes_direction
    smart_person = WisePerson.new
    smart_person.move "L5"

    assert_equal "West", smart_person.direction
  end

  def test_should_move_forward_along_y_axis
    smart_person = WisePerson.new
    smart_person.move_up_along_y_axis 5

    assert_equal [0, 5], smart_person.coordinates
  end

end
