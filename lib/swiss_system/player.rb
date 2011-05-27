module SwissSystem
	class Player

		attr_accessor :name, :points, :small_points

		def initialize(name)
		  @name         = name
		  @points       = 0
		  @small_points = 0
		end
	end
end
