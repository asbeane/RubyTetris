class I
	# Takes an x coord, y coord, board and orientation - and finds the orientation, if any
	# Where an I piece can be found  - given that orientation
	# normalized orientation value to one of the possible orientations of this piece
	def can_place(start_x, start_y, board, orientation)
		current_orientation = (orientation % 2)
		t = (board.length) - 2
		y = (board[0].length) - 2 

   		if current_orientation == 0 #and start_y <= y
			if t >= start_x+3 and start_x >= 1
				if board[start_x][start_y] == 0 and board[start_x+1][start_y] == 0 and \
				board[start_x+2][start_y] == 0 and board[start_x+3][start_y] == 0
					return 0
				end
			elsif t >= start_x+2 and start_x-1 >= 1
				if board[start_x][start_y] == 0 and board[start_x-1][start_y] == 0 and \
				board[start_x+1][start_y] == 0 and board[start_x+2][start_y] == 0
					return 1
				end
			elsif t >= start_x+1 and start_x-2 >= 1
				if board[start_x][start_y] == 0 and board[start_x-1][start_y] == 0 and \
				board[start_x-2][start_y] == 0 and board[start_x+1][start_y] == 0
					return 2
				end
			elsif t >= start_x and start_x-3 >= 1
				if board[start_x][start_y] == 0 and board[start_x-1][start_y] == 0 and \
				board[start_x-2][start_y] == 0 and board[start_x-3][start_y] == 0
					return 3
				end
			end
		elsif current_orientation == 1 #and start_x <= t
			if y >= start_y+3 and start_y >= 1
				if board[start_x][start_y] == 0 and board[start_x][start_y+1] == 0 and \
				board[start_x][start_y+2] == 0 and board[start_x][start_y+3] == 0
					return 4
				end
			elsif y >= start_y+2 and start_y-1 >= 1
				if board[start_x][start_y] == 0 and board[start_x][start_y-1] == 0 and \
				board[start_x][start_y+1] == 0 and board[start_x][start_y+2] == 0
					return 5
				end
			elsif y >= start_y+1 and start_y-2 >= 1
				if board[start_x][start_y] == 0 and board[start_x][start_y-1] == 0 and \
				board[start_x][start_y-2] == 0 and board[start_x][start_y+1] == 0
					return 6
				end	
			elsif y >= start_y and start_y-3 >= 1
				if board[start_x][start_y] == 0 and board[start_x][start_y-1] == 0 and \
				board[start_x][start_y-2] == 0 and board[start_x][start_y-3] == 0
					return 7
				end
			end
		end	
		return -1
	end

	# Finds I pieces on a board and outputs total score for each I found. 4 points per S piece
	# Pre-Condition: Valid board in the form of a 2D array
	# Post-Condition: No data change. Returns unique data value: total
	def find_pieces(board)
		x = (board.length) - 2
		y = (board[0].length) - 2
		total = 0

		for start_x in 1...x
			for start_y in 1...y
				if find_piece_helper(start_x, start_y, board, 0) == 1
					total = total + 1
				end
			end
		end

		for start_y in 1...y
			for start_x in 1...x
				if find_piece_helper(start_x, start_y, board, 1) == 1
					total = total + 1
				end
			end
		end
		return total
	end

	# helper function to find_piece 
	# named Private
	def find_piece_helper(start_x, start_y, board, current_orientation)
		t = (board.length) - 2
		y = (board[0].length) - 2

		if current_orientation == 0
			if t >= start_x+3 && start_x >= 1
				if board[start_x][start_y] ==1 && board[start_x+1][start_y] ==1 && board[start_x+2][start_y] ==1 && board[start_x+3][start_y] ==1
					return 1
				end
			end	
		elsif current_orientation == 1
			if y >= start_y+3 && start_y >= 1
				if board[start_x][start_y] ==1 && board[start_x][start_y+1] ==1 && board[start_x][start_y+2] ==1 && board[start_x][start_y+3] ==1
					return 1
				end
			end
		end
		return -1
	end

	# Add's a piece to board.
	# Pre-Condition - valid board, and start_x and start_y are within bounds of the board dimensions are passed.
	# Post-Conditions - Piece added to board with buffer.
	def add_piece(start_x, start_y, board, orientation)
		case orientation
		when 0
			board[start_x][start_y] = board[start_x+1][start_y] = board[start_x+2][start_y] = board[start_x+3][start_y] = 1
			board[start_x][start_y-1] = board[start_x+1][start_y-1] = board[start_x+2][start_y-1] = board[start_x+3][start_y-1] = 2
			board[start_x][start_y+1] = board[start_x+1][start_y+1] = board[start_x+2][start_y+1] = board[start_x+3][start_y+1] = 2
			board[start_x-1][start_y] = board[start_x+4][start_y] = 2
		when 1
			board[start_x][start_y] = board[start_x-1][start_y] = board[start_x+1][start_y] = board[start_x+2][start_y] = 1
			board[start_x][start_y-1] = board[start_x-1][start_y-1] = board[start_x+1][start_y-1] = board[start_x+2][start_y-1] = 2
			board[start_x][start_y+1] = board[start_x-1][start_y+1] = board[start_x+1][start_y+1] = board[start_x+2][start_y+1] = 2
			board[start_x-2][start_y] = board[start_x+3][start_y] = 2
		when 2
			board[start_x][start_y] = board[start_x-1][start_y] = board[start_x-2][start_y] = board[start_x+1][start_y] = 1
			board[start_x][start_y-1] = board[start_x-1][start_y-1] = board[start_x-2][start_y-1] = board[start_x+1][start_y-1] = 2
			board[start_x][start_y+1] = board[start_x-1][start_y+1] = board[start_x-2][start_y+1] = board[start_x+1][start_y+1] = 2
			board[start_x-3][start_y] = board[start_x+2][start_y] = 2
		when 3
			board[start_x][start_y] = board[start_x-1][start_y] = board[start_x-2][start_y] = board[start_x-3][start_y] = 1
			board[start_x][start_y-1] = board[start_x-1][start_y-1] = board[start_x-2][start_y-1] = board[start_x-3][start_y-1] = 2
			board[start_x][start_y+1] = board[start_x-1][start_y+1] = board[start_x-2][start_y+1] = board[start_x-3][start_y+1] = 2
			board[start_x-4][start_y] = board[start_x+1][start_y] = 2
		when 4
			board[start_x][start_y] = board[start_x][start_y+1] = board[start_x][start_y+2] = board[start_x][start_y+3] = 1
			board[start_x+1][start_y] = board[start_x+1][start_y+1] = board[start_x+1][start_y+2] = board[start_x+1][start_y+3] = 2
			board[start_x-1][start_y] = board[start_x-1][start_y+1] = board[start_x-1][start_y+2] = board[start_x-1][start_y+3] = 2
			board[start_x][start_y-1] = board[start_x][start_y+4] = 2
		when 5
			board[start_x][start_y] = board[start_x][start_y-1] = board[start_x][start_y+1] = board[start_x][start_y+2] = 1
			board[start_x-1][start_y] = board[start_x-1][start_y-1] = board[start_x-1][start_y+1] = board[start_x-1][start_y+2] = 2
			board[start_x+1][start_y] = board[start_x+1][start_y-1] = board[start_x+1][start_y+1] = board[start_x+1][start_y+2] = 2
			board[start_x][start_y-2] = board[start_x][start_y+3] = 2
		when 6
			board[start_x][start_y] = board[start_x][start_y-1] = board[start_x][start_y-2] = board[start_x][start_y+1] = 1
			board[start_x-1][start_y] = board[start_x-1][start_y-1] = board[start_x-1][start_y-2] = board[start_x-1][start_y+1] = 2
			board[start_x+1][start_y] = board[start_x+1][start_y-1] = board[start_x+1][start_y-2] = board[start_x+1][start_y+1] = 2
			board[start_x][start_y-3] = board[start_x][start_y+2] = 2 
		when 7
			board[start_x][start_y] = board[start_x][start_y-1] = board[start_x][start_y-2] = board[start_x][start_y-3] = 1
			board[start_x-1][start_y] = board[start_x-1][start_y-1] = board[start_x-1][start_y-2] = board[start_x-1][start_y-3] = 2
			board[start_x+1][start_y] = board[start_x+1][start_y-1] = board[start_x+1][start_y-2] = board[start_x+1][start_y-3] = 2
			board[start_x][start_y+1] = board[start_x][start_y-4] = 2
		end
	end

	# Set function to private since helper.
	private :find_piece_helper
end