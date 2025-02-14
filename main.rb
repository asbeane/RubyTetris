require_relative 'Board.rb'
require_relative 'I.rb'
require_relative 'O.rb'
require_relative 'J.rb'
require_relative 'T.rb'
require_relative 'S.rb'

# Main Function Definition
def main()

	# Command Args
	loop_count = ARGV[0].to_i
	print_init = ARGV[1].to_i
	print_final = ARGV[2].to_i

	# Initialize Array of pieces, with possible piece types.
	pieces = Array.new.push(I.new, O.new, J.new, T.new, S.new)

	randomVariable = Random.new

	ARGV[0].to_i.times do |i|
		x = randomVariable.rand(6...30)
		y = randomVariable.rand(6...30)
		# Initialize Board to random value between 6-30 by 6-30
		testBoard = Board.new(x, y)

		# Use Area of Board with average density of shape (14 cells) to get a shape count (pseudo-randomly).
		density = randomVariable.rand(1...( (x*y)/14))

		# Draw Initial Board
		if print_init == 1
			testBoard.draw_board()
		end

		# Score to 0, for each board simulation. -1 is an invalid orientation.
		score = 0
		orientation = -1

		# Adding random pieces to loops
		density.times do |i|
			if (orientation = pieces[temp = randomVariable.rand(pieces.length)].can_place(j = randomVariable.rand(1...x),k = randomVariable.rand(1...y), testBoard.instance_variable_get(:@board), Random.new.rand(8))) != -1
				pieces[temp].add_piece(j,k,testBoard.instance_variable_get(:@board), orientation)
			end
		end

		pieces.length.times do |i|
			score += pieces[i].find_pieces(testBoard.instance_variable_get(:@board))
		end

		# draw final Board		
		if print_final == 1
			testBoard.draw_board()
		end
		
		puts "Final Score is: " + score.to_s
	end
end

##### Program Execution Area ####
main()