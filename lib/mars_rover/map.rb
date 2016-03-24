module MarsRover
  module Map
    class << self
      attr_accessor :max_x, :max_y
      def check_invalid?(position)
        (position.x > max_x || position.y > max_y || position.x < 0 || position.y < 0) ? true : false
      end
    end
  end
end
