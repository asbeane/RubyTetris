class O

	# Takes an x coord, y coord, board and orientation - and finds the orientation, if any
	# Where an O piece can be found  - given that orientation
	# normalized orientation value to the single orientation of this piece
	def can_place(start_x, start_y, board, orientation)
		current_orientation = (orientation % 1)

		x = (board.length) - 2
		y = (board[0].length) - 2 

		if x >= start_x+2 and start_y+2 <= y
			if board[start_x][start_y] == 0 && board[start_x+1][start_y] == 0 and \
			board[start_x][start_y+1] == 0 && board[start_x+1][start_y+1] == 0
				return 0
			end 
		elsif start_x-2 >= 1 and start_y+2 <= y
			if board[start_x][start_y] == 0 &&  board[start_x-1][start_y] == 0 and \
			board[start_x-1][start_y+1] == 0 && board[start_x][start_y+1] == 0
				return 1
			end
		elsif start_x+2 <= x and start_y-2 >= 1
			if board[start_x][start_y] == 0 &&  board[start_x][start_y-1] == 0 and \
			board[start_x+1][start_y-1] == 0 && board[start_x+1][start_y] == 0
				return 2
			end
		elsif start_x-2 >= 1 and y-2 >= 1
			if board[start_x][start_y] == 0 &&  board[start_x][start_y-1] == 0 and \
			board[start_x-1][start_y-1] == 0 && board[start_x-1][start_y] == 0
				return 3
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
			board[start_x][start_y] = board[start_x+1][start_y] = board[start_x][start_y+1] = board[start_x+1][start_y+1] = 3
		when 1
			board[start_x][start_y] = board[start_x-1][start_y] = board[start_x-1][start_y+1] = board[start_x][start_y+1] = 3
		when 2
			board[start_x][start_y] = board[start_x][start_y-1] = board[start_x+1][start_y-1] = board[start_x+1][start_y] = 3
		when 3
			board[start_x][start_y] = board[start_x][start_y-1] = board[start_x-1][start_y-1] = board[start_x-1][start_y] = 3
		end
	end

	# Finds O pieces on a board and outputs total score for each O found. 3 points per O piece
	# Pre-Condition: Valid board in the form of a 2D array
	# Post-Condition: No data change. Returns unique data value: total
	def find_pieces(board)
		x = (board.length) - 2
		y = (board[0].length) - 2
		total = 0

		for start_x in 1...x
			for start_y in 1...y
				if find_piece_helper(start_x, start_y, board, 0) == 1
					total = total + 3
				end
			end
		end
		return total
	end

	# helper function to find_piece 
	# named Private
	def find_piece_helper(start_x, start_y, board, current_orientation)
		x = (board.length) - 2
		y = (board[0].length) - 2

		if x >= start_x+2 and start_y+2 <= y
			if board[start_x][start_y] == 3 && board[start_x+1][start_y] == 3 and \
			board[start_x][start_y+1] == 3 && board[start_x+1][start_y+1] == 3
				return 1
			end 
		end
		return -1
	end

	# Set Helper to Private Since Helper
	private :find_piece_helper
end