require 'test_helper'

class RoverTest < Minitest::Test

  describe "MarsRover::Rover" do
    def setup
      @rover = MarsRover::Rover.new(x: 0, y: 0, direction: "E", instructions: "")
    end

    describe "initialization" do
      def test_that_rover_is_initialized_correctly
        assert_equal 0, @rover.x
        assert_equal 0, @rover.y
        assert_equal "E", @rover.direction
        assert_equal "", @rover.instructions
      end
    end

    describe "movement" do
      def test_that_rover_should_rotate_left_correctly
        @rover.instance_variable_set(:@instructions, "L")
        @rover.execute!
        assert_equal "N", @rover.direction
      end

      def test_that_rover_should_rotate_right_correctly
        @rover.instance_variable_set(:@instructions, "R")
        @rover.execute!
        assert_equal "S", @rover.direction
      end

      def test_that_rover_should_move_forward_correctly
        @rover.instance_variable_set(:@instructions, "MM")
        MarsRover::Map.stub(:check_invalid?, false) do
          @rover.execute!
        end
        assert_equal 2, @rover.x
        assert_equal 0, @rover.y
      end
    end
  end
end
