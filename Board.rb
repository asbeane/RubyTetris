class Board
	# pre_conditions: Non negative X values to init 2D Array as board
	# Board object createed with X by Y dimensions
	def initialize(x ,y)
		# init members
		@x_dimension = x
		@y_dimension = y
		@score       = 0
		@board       = Array.new(x+2){Array.new(y+2, 0)}
	end

	# Draws board for number of rows and columns
	def draw_board()
		for i in 1...@y_dimension+1
			puts " ------"*@x_dimension
			for k in 0...2
				for j in 1...@x_dimension+1
					if @board[j][i] > 0 && k == 0
						print "|  " + @board[j][i].to_s + "   " 
					else
						print "|      "
					end
				end
				puts "|"
			end	

		end
		puts " ------"*@x_dimension
	end

	# incremental test_function
	def add_random_values(start_x, start_y, count)
		r = Random.new
		for i in 0...count
			@board[r.rand(start_x...@x_dimension)][r.rand(start_y...@y_dimension)] = 1
		end
	end
end
