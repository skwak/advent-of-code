class WisePerson
  attr_reader :direction, :instruction, :coordinates, :visited_places

  def initialize
    @direction = "North"
    @coordinates = [0, 0]
    @visited_places = []
  end

  def move_up_along_y_axis steps
    steps.times { |step| @visited_places << [ @coordinates[0], @coordinates[1] += 1 ] }
  end

  def move_down_along_y_axis steps
    steps.times { |step| @visited_places << [ @coordinates[0], @coordinates[1] -= 1] }
  end

  def move_forwards_along_x_axis steps
    steps.times { |step| @visited_places << [ @coordinates[0] += 1, @coordinates[1] ] }
  end

  def move_backwards_along_x_axis steps
    steps.times { |step| @visited_places << [ @coordinates[0] -= 1, @coordinates[1] ]}
  end

  def least_number_of_steps ending_coordinates
    ending_coordinates[0].abs + ending_coordinates[1].abs
  end

  def move instruction
    case @direction
    when "North"
      if instruction[0] == "L"
        @direction = "West"
        move_backwards_along_x_axis instruction[1..-1].to_i
      else
        @direction = "East"
        move_forwards_along_x_axis instruction[1..-1].to_i
      end
    when "East"
      if instruction[0] == "L"
        @direction = "North"
        move_up_along_y_axis instruction[1..-1].to_i
      else
        @direction = "South"
        move_down_along_y_axis instruction[1..-1].to_i
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

class GPSTracker
  attr_reader :first_twice_visited

  def initialize all_steps
    @all_steps = all_steps
    first_sighting
  end

  def first_sighting
    all_twice_visited = []
    @all_steps.each_with_index do |coordinates, index|
      all_comparing_steps = @all_steps[index+1..-1]
      all_comparing_steps.each do |comparing_coordinates|
        if (coordinates == comparing_coordinates)
          all_twice_visited << coordinates
        end
      end
    end
    @first_twice_visited = all_twice_visited.first
  end
end


clever_witch = WisePerson.new

directions =
%w[ L5, R1, L5, L1, R5, R1, R1, L4, L1, L3, R2, R4, L4, L1, L1, R2, R4, R3, L1,
    R4, L4, L5, L4, R4, L5, R1, R5, L2, R1, R3, L2, L4, L4, R1, L192, R5, R1,
    R4, L5, L4, R5, L1, L1, R48, R5, R5, L2, R4, R4, R1, R3, L1, L4, L5, R1, L4,
    L2, L5, R5, L2, R74, R4, L1, R188, R5, L4, L2, R5, R2, L4, R4, R3, R3, R2,
    R1, L3, L2, L5, L5, L2, L1, R1, R5, R4, L3, R5, L1, L3, R4, L1, L3, L2, R1,
    R3, R2, R5, L3, L1, L1, R5, L4, L5, R5, R2, L5, R2, L1, L5, L3, L5, L5, L1,
    R1, L4, L3, L1, R2, R5, L1, L3, R4, R5, L4, L1, R5, L1, R5, R5, R5, R2, R1,
    R2, L5, L5, L5, R4, L5, L4, L4, R5, L2, R1, R5, L1, L5, R4, L3, R4, L2, R3,
    R3, R3, L2, L2, L2, L1, L4, R3, L4, L2, R2, R5, L1, R2 ]

directions.each_with_index do |direction, index|
  clever_witch.move direction

  last = directions.length - 1

  if index == last
    coords = clever_witch.coordinates
    puts "The coords of the Easter Bunny HQ is #{coords}."
    steps = clever_witch.least_number_of_steps coords
    puts "The least number of steps is: #{steps}."
  end
end

all_places = clever_witch.visited_places
tracker = GPSTracker.new all_places
first_twice_visited_steps = clever_witch.least_number_of_steps tracker.first_twice_visited

puts "The first twice visited place is #{first_twice_visited_steps} steps away from origin."
