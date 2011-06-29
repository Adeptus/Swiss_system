module SwissSystem
  class Player
    attr_accessor :name, :points, :small_points

    def initialize(name, points = nil, small_points = nil)
      @name         = name
      @points       = points       ||= 0
      @small_points = small_points ||= 0
    end
  end
end
