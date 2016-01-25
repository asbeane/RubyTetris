class Board
	def initialize(x ,y)
		# May get rid of these
		@x_dimension = x
		@y_dimension = y
		@board       = Array.new(x){Array.new(y)}
		for i in 0 ...@x_dimension
			for j in 0...@y_dimension
				@board[i][j] = 0
			end
		end
	end

	# Draws board for number of rows and columns
	def draw_board()
		for i in 0...@y_dimension
			puts " ------"*@x_dimension
			for k in 0...2
				for j in 0...@x_dimension
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

	# check return of board, value, or refernene?
	def add_piece(start_x, start_y, piece)
		piece.draw_piece(start_x, start_y, @board)
	end
end
