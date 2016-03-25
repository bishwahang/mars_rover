require 'test_helper'

class MapTest < Minitest::Test
  describe "MarsRover::Map" do
    def setup
      MarsRover::Map.max_x = 9
      MarsRover::Map.max_y = 9
    end

    def test_that_max_x_and_y_are_set_correctly
      assert_equal 9, MarsRover::Map.max_x
      assert_equal 9, MarsRover::Map.max_y
    end

    def test_that_check_invalid_works_correctly
      position = Minitest::Mock.new
      # 'true' when 'x' is larger than map max_x
      position.expect :x, 10
      assert_equal true, MarsRover::Map.check_invalid?(position)
      # 'true' when 'y' is larger than map max_y
      position.expect :x, 9
      position.expect :y, 10
      assert_equal true, MarsRover::Map.check_invalid?(position)
      # 'true' when 'x' is smallers than 0
      position.expect :x, -1
      position.expect :y, 0
      position.expect :x, -1
      assert_equal true, MarsRover::Map.check_invalid?(position)
      # 'true' when 'y' is smallers than 0
      position.expect :x, 0
      position.expect :y, -1
      position.expect :x, 0
      position.expect :y, -1
      assert_equal true, MarsRover::Map.check_invalid?(position)
      # 'false' when x and y are withing the map
      position.expect :x, 5
      position.expect :y, 5
      position.expect :x, 5
      position.expect :y, 5
      assert_equal false, MarsRover::Map.check_invalid?(position)
    end
  end
end
