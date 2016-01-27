class Board
	def initialize(x ,y)
		# May get rid of these
		@x_dimension = x
		@y_dimension = y
		@score       = 0
		@board       = Array.new(x+2){Array.new(y+2, 0)}
		#for i in 0...@x_dimension	
		#	for j in 0...@y_dimension+1
		#		puts "i: "
		#		puts i
		#		puts "j: "
		#		puts j
		#		@board[i][j] = 0
		#	end
		#end
	end

	# Draws board for number of rows and columns
	def draw_board()
		for i in 1...@y_dimension+1
			puts " ------"*@x_dimension
			for k in 0...2
				for j in 1...@x_dimension+1
					if @board[j][i] == 1 && k == 0
						print "|  1   "
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

	# Score the board by counting 1 values:
	def score()
		for i in 1...@x_dimension+1
			for j in 1...@y_dimension+1
				if @board[i][j] == 1 
					@score +=1
				end
			end
		end
		return @score
	end

end
