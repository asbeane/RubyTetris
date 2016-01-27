require_relative 'Board.rb'
class I
	#@number_orientations = 2

	def initialize()
	end

	def flip()
	end

	# may not find all placable locations .. do I need to expand
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

	def find_pieces(x,y,board)
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
			board[start_x][start_y-2] =  board[start_x][start_y+3] = 2
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
		print "orientation: "
		puts orientation
		print "x: "
		puts start_x
		print "y: "
		puts start_y
	end

	def if_there_helper(x,y,board, if_up, if_down, count)
	end


end