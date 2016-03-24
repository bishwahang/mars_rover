require_relative "mars_rover/version"
require_relative "mars_rover/map"
require_relative "mars_rover/rover"

module MarsRover
  def self.run
    max_x, max_y = gets.chomp.split
    Map.max_x    = max_x.to_i
    Map.max_y    = max_y.to_i
    test_cases   = gets.chomp.to_i
    results      = []

    test_cases.times do
      current_postion = gets.chomp.split
      instructions = gets.chomp
      rover = MarsRover::Rover.new(x: current_postion[0].to_i, y: current_postion[1].to_i, direction: current_postion[2], instructions: instructions)
      results << rover.execute!
    end
    puts results.join("\n")
  end
end

if $0 == __FILE__
  MarsRover.run
end
