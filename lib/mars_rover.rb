require_relative "mars_rover/version"
require_relative "mars_rover/map"
require_relative "mars_rover/rover"

module MarsRover
  def self.run
    max_x, max_y = gets.chomp.split
    Map.max_x = max_x
    Map.max_y = max_y
    test_cases = gets.chomp.to_i

    test_cases.times do
      current_postion = gets.chomp.split
      instructions = gets.chomp
      rover = MarsRover::Rover.new(x: current_postion[0].to_i, y: current_postion[1].to_i, direction: current_postion[2], instructions: instructions)
      puts rover.execute!
    end
  end
end
