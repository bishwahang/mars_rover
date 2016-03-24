module MarsRover
  class Rover
    attr_reader :instructions
    def initialize(current_postion:, instructions:)
      @current_position = current_postion
      @instructions = instructions
    end

    def execute!
      # puts "Executed"
    end
  end
end
