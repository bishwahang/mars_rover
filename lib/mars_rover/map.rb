module MarsRover
  module Map
    class << self
      attr_accessor :max_x, :max_y
      def min_x;return 0;end
      def min_y;return 0;end

      def check_invalid?(position)
        (position.x > max_x || position.y > max_y || position.x < min_x || position.y < min_y) ? true : false
      end
    end
  end
end
