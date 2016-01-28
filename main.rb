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

	# Take command Arg to indicate Number of Loops
	for i in 0...ARGV[0].to_i
		x = Random.new.rand(5...30)
		y = Random.new.rand(5...30)
		# Initialize Board to random value between 1-30 by 1-30
		testBoard = Board.new(x, y)

		# Use Area of Board with average density of shape to get a shape count (pseudo-randomly)
		density = Random.new.rand(1...( (x*y)/14))


		# Draw Initial Board
		if print_init == 1
			testBoard.draw_board()
		end

		pieces = Array.new
		pieces.push(I.new())
		pieces.push(O.new())
		pieces.push(J.new())
		pieces.push(T.new())
		pieces.push(S.new())

		score = 0
		orientation = -1

		# Adding random pieces to loops
		i = 0
		while i < density
			temp = Random.new.rand(pieces.length)
			#temp = 3
				if (orientation = pieces[temp].can_place(j = Random.new.rand(1...x),k = Random.new.rand(1...y), testBoard.instance_variable_get(:@board), Random.new.rand(8))) != -1
					#orientation = 2
					pieces[temp].add_piece(j,k,testBoard.instance_variable_get(:@board), orientation)
					i += 1
				end
		end

		for i in 0...pieces.length
			score += pieces[i].find_pieces(testBoard.instance_variable_get(:@board))
		end

		# draw final Board		
		if print_final == 1
			testBoard.draw_board()
		end
		
		print "Final Score is: "
		puts score
	end
end

##### Program Execution Area ####
main()
