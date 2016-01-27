require_relative 'Board.rb'
require_relative 'I.rb'

def main()
	testBoard = Board.new(10, 5)
	testBoard.draw_board()

	testIPiece = I.new()

	#puts testIPiece.can_place(0, 0, testBoard.instance_variable_get(:@board), 10)


	# test board drawing more with 1 values
	#testBoard.add_random_values(0,0,10)

	r = Random.new
	x = 10
	y = 5

	s = -1
	x_new = y_new = i = 0

	#y_new = r.rand(0...y)
	#x_new = r.rand(0...x)
	# r.rand(2)
	#testIPiece.add_piece(9, 0, testBoard.instance_variable_get(:@board), 4)

	while i  < 4
		if ((s = testIPiece.can_place(x_new = r.rand(1...x), y_new = r.rand(1...y), testBoard.instance_variable_get(:@board), r.rand(2))) != -1)
			testIPiece.add_piece(x_new, y_new, testBoard.instance_variable_get(:@board), s)
			i += 1 
		end
	end

	testBoard.draw_board()
	puts testBoard.score()


#	for x in 0...10
#		for y in 0...5
#			print "x: "
#			puts x
#			print "y: "
#			puts y
#		end
#	end

	# Create each piece type - and fill the board with that type each.
	# When all types are done -- nead to create an array of piece -- flip a coin for % pieces and add a piece
	# consider that different pieces COULD either have a separate class .. or will have a more complicate orientation
	# DO I and square first for simplicity .. then do J, S, and T 

end

main()