class I

	@number_orientations = 2

	def initialize()
	end

	def flip()
	end

	def can_place(start_x, start_y, board)
		if board[start_x][start_y] == 0 and board[start_x+1][start_y] == 0 and \
		board[start_x+2][start_y] == 0 and board[start_x+3][start_y] == 0
			return true
		elsif board[start_x][start_y] == 0 and board[start_x][start_y+1] == 0 and \
		board[start_x][start_y+2] == 0 and board[start_x][start_y+3] == 0
			return true
			

	end


end