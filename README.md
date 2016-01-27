# RubyTetris
Ruby Tetris Board Scorer

This is a board scorer for Tetris where pieces can only touch on diagonals.

How to run:
  ruby main.rb arg1 arg2 arg3
  
  arg1 - number of boards to score/simulate
  arg2 - If 1, For each board, draw the initial empty to the terminal/prompt in ascii characters.
  arg2 - If 1 - For each board

Classes:
  Board - Takes X and Y coordinates which implements a X by Y board.
    Board.new(x,y)
  
  I => I Tetris Piece.
    I.new()
    
  J => J Tetris Piece
    J.new()
    
  O => O (or square) Tetris Piece
    O.new()
    
  S => S Tetris Piece
    S.new()
    
  T => T Tetris Piece 
    T.new()
    
Each of the Piece classes have the same 3 public functions, plus 1 private helper, implemented. Which allows for simpler, and more reporducable use when using the  different classes.

Public Methods:

can_place() - Arguments
  start_x: Starting X coordinate to check if the Piece is placable on the board.
  start_y: Starting Y coordinate to check if the Piece is placable on the board.
  board: 2D Array, which is the array describing the board to be checked for piece placability.
  orientation - A number, is normalized internally for the number of orientations a given piece has. Used to check a given orientation   for placability.
  
  
add_piece() - Arguments. Assumes placability has already been checked.
  start_x - Starting x value to add add a piece to a board.  
  start_y - Starting y value to add a piece to a board.
  board -   2D Array representation of the board to add the piece too.
  orientation - The orientation to add to the board. Expects a valid orientation 0-orientations-1 for that piece
  
  find_pieces() - Arguments. Traverses a board and reports the total score given the number of the given piece on the board.
    board - the board to score for a given piece
