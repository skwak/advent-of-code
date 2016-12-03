class WisePerson
  attr_reader :direction, :instruction, :coordinates

  def initialize
    @direction = "North"
    @coordinates = [0, 0]
  end

  def move_up_along_y_axis steps
    @coordinates[1] += steps
  end

  def move_down_along_y_axis steps
    @coordinates[1] -= steps
  end

  def move_forwards_along_x_axis steps
    @coordinates[0] += steps
  end

  def move_backwards_along_x_axis steps
    @coordinates[0] -= steps
  end

  def least_number_of_steps ending_coordinates
    ending_coordinates[0].abs + ending_coordinates[1].abs
  end

  def move instruction
    case @direction
    when "North"
      if instruction[0] == "L"
        @direction = "West"
        move_down_along_y_axis instruction[1..-1].to_i
      else
        @direction = "East"
        move_up_along_y_axis instruction[1..-1].to_i
      end
    when "East"
      if instruction[0] == "L"
        @direction = "North"
        move_forwards_along_x_axis instruction[1..-1].to_i
      else
        @direction = "South"
        move_backwards_along_x_axis instruction[1..-1].to_i
      end
    when "West"
      if instruction[0] == "L"
        @direction = "South"
        move_down_along_y_axis instruction[1..-1].to_i
      else
        @direction = "North"
        move_up_along_y_axis instruction[1..-1].to_i
      end
    when "South"
      if instruction[0] == "L"
        @direction = "East"
        move_forwards_along_x_axis instruction[1..-1].to_i
      else
        @direction = "West"
        move_backwards_along_x_axis instruction[1..-1].to_i
      end
    end
  end
end

clever_witch = WisePerson.new

directions =
[ "L5", "R1", "L5", "L1", "R5", "R1", "R1", "L4", "L1", "L3", "R2", "R4", "L4",
  "L1", "L1", "R2", "R4", "R3", "L1", "R4", "L4", "L5", "L4", "R4", "L5", "R1",
  "R5", "L2", "R1", "R3", "L2", "L4", "L4", "R1", "L192", "R5", "R1", "R4",
  "L5", "L4", "R5", "L1", "L1", "R48", "R5", "R5", "L2", "R4", "R4", "R1", "R3",
  "L1", "L4", "L5", "R1", "L4", "L2", "L5", "R5", "L2", "R74", "R4", "L1",
  "R188", "R5", "L4", "L2", "R5", "R2", "L4", "R4", "R3", "R3", "R2", "R1",
  "L3", "L2", "L5", "L5", "L2", "L1", "R1", "R5", "R4", "L3", "R5", "L1", "L3",
  "R4", "L1", "L3", "L2", "R1", "R3", "R2", "R5", "L3", "L1", "L1", "R5", "L4",
  "L5", "R5", "R2", "L5", "R2", "L1", "L5", "L3", "L5", "L5", "L1", "R1", "L4",
  "L3", "L1", "R2", "R5", "L1", "L3", "R4", "R5", "L4", "L1", "R5", "L1", "R5",
  "R5", "R5", "R2", "R1", "R2", "L5", "L5", "L5", "R4", "L5", "L4", "L4", "R5",
  "L2", "R1", "R5", "L1", "L5", "R4", "L3", "R4", "L2", "R3", "R3", "R3", "L2",
  "L2", "L2", "L1", "L4", "R3", "L4", "L2", "R2", "R5", "L1", "R2" ]

  directions.each_with_index do |direction, index|
    clever_witch.move direction
    last = directions.length - 1
    if index == last
      coords = clever_witch.coordinates
      steps = clever_witch.least_number_of_steps coords
      puts "The least number of steps is: #{steps}."
    end
  end
