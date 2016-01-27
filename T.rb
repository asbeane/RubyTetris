class T
	# Takes an x coord, y coord, board and orientation - and finds the orientation, if any
	# Where a T piece can be found  - given that orientation
	# normalized orientation for the number of orientations of this piece
	def can_place(start_x, start_y, board, orientation)
		current_orientation = (orientation % 4)
		x = (board.length) - 2
		y = (board[0].length) - 2 
		
		if current_orientation == 0
			if x >= start_x+2 && y >= start_y+1
				if board[start_x][start_y] == 0 && board[start_x+1][start_y] == 0 && \
				board[start_x+2][start_y] == 0 && board[start_x+1][start_y+1] == 0
					return 0
				end
			end
		elsif current_orientation == 1
			if 1 <= start_x-1 && start_y+2 <= y
				if board[start_x][start_y] == 0 && board[start_x-1][start_y+1] == 0 && \
				board[start_x][start_y+1] == 0 && board[start_x][start_y+2] == 0
					return 1
				end
			end
		elsif current_orientation == 2
			if x >= start_x+2 && start_y-1 >= 1
				if board[start_x][start_y] == 0 && board[start_x+1][start_y] == 0 && \
				board[start_x+2][start_y] == 0 && board[start_x+1][start_y-1] == 0
					return 2
				end
			end
		elsif current_orientation == 3
			if x >= start_x+1 && y >= start_y+2
				if board[start_x][start_y] == 0 && board[start_x+1][start_y+1] == 0 && \
				board[start_x][start_y+1] == 0 && board[start_x][start_y+2] == 0
					return 3
				end
			end
		end
		return -1
	end

	# Adds a piece to board.
	# Pre-Condition - valid board, and start_x and start_y are within bounds of the board dimensions are passed.
	# Post-Conditions - Piece added to board with buffer.
	def add_piece(start_x, start_y, board, orientation)
		case orientation
		when 0
			board[start_x][start_y] = board[start_x+1][start_y] = board[start_x+2][start_y] = board[start_x+1][start_y+1] = 1
			board[start_x][start_y-1] = board[start_x+1][start_y-1] = board[start_x+2][start_y-1] = board[start_x+3][start_y] = 2
			board[start_x+2][start_y+1] = board[start_x+1][start_y+2] = board[start_x][start_y+1] = board[start_x-1][start_y] = 2
		when 1
			board[start_x][start_y] = board[start_x-1][start_y+1] = board[start_x][start_y+1] = board[start_x][start_y+2] = 1
			board[start_x][start_y-1] = board[start_x+1][start_y] = board[start_x+1][start_y+1] = board[start_x+1][start_y+2] = 2
			board[start_x][start_y+3] = board[start_x-1][start_y+2] = board[start_x-2][start_y+1] = board[start_x][start_y-1] = 2
		when 2
			board[start_x][start_y] = board[start_x+1][start_y] = board[start_x+2][start_y] = board[start_x+1][start_y-1] = 1
			board[start_x][start_y-1] = board[start_x+1][start_y-2] = board[start_x+2][start_y-1] = board[start_x+3][start_y] = 2
			board[start_x+2][start_y+1] = board[start_x+1][start_y+1] = board[start_x][start_y+1] = board[start_x-1][start_y] = 2
		when 3
			board[start_x][start_y] = board[start_x+1][start_y+1] = board[start_x][start_y+1] = board[start_x][start_y+2] = 1
			board[start_x][start_y-1] = board[start_x+1][start_y] = board[start_x+2][start_y+1] = board[start_x+1][start_y+2] = 2
			board[start_x][start_y+3] = board[start_x-1][start_y+2] = board[start_x-1][start_y+1] = board[start_x-1][start_y] = 2
		end
	end

	# Finds T pieces on a board and outputs total score for each O found. 5 points per T piece
	# Pre-Condition: Valid board in the form of a 2D array
	# Post-Condition: No data change. Returns unique data value: total
	def find_pieces(board)
		x = (board.length) - 2
		y = (board[0].length) - 2
		total = 0

		for start_x in 1...x
			for start_y in 1...y
				if find_piece_helper(start_x, start_y, board) == 1
					total = total + 5
				end
			end
		end
		return total
	end

	# helper function to find_pieces 
	# named Private
	def find_piece_helper(start_x, start_y, board)
		x = (board.length) - 2
		y = (board[0].length) - 2

		if x >= start_x+2 && y >= start_y+1
			if board[start_x][start_y] == 1 && board[start_x+1][start_y] == 1 && \
			board[start_x+2][start_y] == 1 && board[start_x+1][start_y+1] == 1
				return 1
			end
		end
		if start_x-1 >= 1 && start_y+2 <= y
			if board[start_x][start_y] == 1 && board[start_x-1][start_y+1] == 1 && \
			board[start_x][start_y+1] == 1 && board[start_x][start_y+2] == 1
				return 1
			end
		end
		if x >= start_x+2 && start_y-1 >= 1
			if board[start_x][start_y] == 1 && board[start_x+1][start_y] == 1 && \
			board[start_x+2][start_y] == 1 && board[start_x+1][start_y-1] == 1
				return 1
			end
		end
		if start_x+1 <= x && start_y+2 <= y
			if board[start_x][start_y] == 1 && board[start_x+1][start_y+1] == 1 && \
			board[start_x][start_y+1] == 1 && board[start_x][start_y+2] == 1
				return 1
			end
		end
		return -1
	end

	# Helper Function should be private 
	private :find_piece_helper

end	 # End of Class