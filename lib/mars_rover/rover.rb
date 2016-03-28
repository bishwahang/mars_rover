module MarsRover
  class Rover
    MOVE_DELTAS  = {"N" => [0,1], "E" => [1,0], "W" => [-1,0], "S" => [0,-1]}
    ROTATE_LEFT  = {"N" => "W", "E" => "N", "W" => "S", "S" => "E"}
    ROTATE_RIGHT = {"N" => "E", "E" => "S", "W" => "N", "S" => "W"}

    attr_reader :instructions

    Position = Struct.new(:x, :y, :direction)

    def initialize(x:, y:, direction:, instructions:)
      @current_position = Position.new(x,y,direction)
      @instructions = instructions
    end

    def execute!
      instructions.chars.each do |ins|
        case ins
        when "M"
          move_forward
        when "R"
          rotate_right
        when "L"
          rotate_left
        else
          raise "invalid instruction #{ins}: allowed instruction are R,L,M only"
        end
      end
      "#{current_position.x} #{current_position.y} #{current_position.direction}"
    end

    def x; current_position.x; end

    def y; current_position.y; end

    def direction; current_position.direction; end

    private

    attr_accessor :current_position

    def move_forward
      current_position.x += MOVE_DELTAS[current_position.direction][0]
      current_position.y += MOVE_DELTAS[current_position.direction][1]
      raise "invalid move: out of map boundary" if MarsRover::Map.check_invalid? current_position
    end

    def rotate_left
      current_position.direction = ROTATE_LEFT[current_position.direction]
    end

    def rotate_right
      current_position.direction = ROTATE_RIGHT[current_position.direction]
    end
  end
end
