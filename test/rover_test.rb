require 'test_helper'

class RoverTest < Minitest::Test

  describe "MarsRover::Rover" do
    def setup
      @rover = MarsRover::Rover.new(x: 0, y: 0, direction: "E", instructions: "")
    end

    describe "initialization" do
      def test_that_rover_is_initialized_correctly
        assert_equal 0, @rover.current_position.x
        assert_equal 0, @rover.current_position.y
        assert_equal "E", @rover.current_position.direction
        assert_equal [], @rover.instructions
      end
    end

    describe "movement" do
      def test_that_rover_should_rotate_left_correctly
        @rover.instance_variable_set(:@instructions, ["L"])
        @rover.execute!
        assert_equal "N", @rover.current_position.direction
      end

      def test_that_rover_should_rotate_right_correctly
        @rover.instance_variable_set(:@instructions, ["R"])
        @rover.execute!
        assert_equal "S", @rover.current_position.direction
      end

      def test_that_rover_should_move_forward_correctly
        @rover.instance_variable_set(:@instructions, ["M", "M"])
        MarsRover::Map.stub(:check_invalid?, false) do
          @rover.execute!
        end
        assert_equal 2, @rover.current_position.x
        assert_equal 0, @rover.current_position.y
      end
    end
  end
end
