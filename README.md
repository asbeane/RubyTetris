# RubyTetris
Ruby Tetris Board Scorer

This is a board scorer for Tetris where pieces can only touch on diagonals.

How to run:
  ruby main.rb [arg1] [arg2] [arg3]<br>
  
  arg1 - number of boards to score/simulate <br>
  arg2 - If 1, For each board, draw the initial empty board to the terminal/prompt in ascii characters.<br>
  arg2 - If 1  For each board, draw the filled board with pieces.<br>

Result:
  For the number of simulations, runs that many boards of pseudo random dimensions between 5-30 length and width, and scores it.<br>
  The program will Always output final score of board.<br>
  Small Note for board drawing: Tested on windows and Mac OS - for larger dimensions of width, there was some distortion in the ASCII
  representation of the board, visually. The scoring still appears to work fine - but the visual drawing can become distored when the
  the row length exceeds the width of the command/terminal window.<br><br>

Classes:<br>
  Board - Takes X and Y coordinates which implements a X by Y board.<br>
    Board.new(x,y)<br>
  
  I => I Tetris Piece.<br>
    I.new()<br>
    
  J => J Tetris Piece<br>
    J.new()<br>
    
  O => O (or square) Tetris Piece<br>
    O.new()<br>
    
  S => S Tetris Piece<br>
    S.new()<br>
    
  T => T Tetris Piece <br>
    T.new()<br>
    
Each of the Piece classes have the same 3 public functions, plus 1 private helper, implemented. Which allows for simpler, and more reporducable use when using the  different classes.<br><br>

Public Methods:<br>
can_place() - Arguments<br>
  start_x: Starting X coordinate to check if the Piece is placable on the board.<br>
  start_y: Starting Y coordinate to check if the Piece is placable on the board.<br>
  board: 2D Array, which is the array describing the board to be checked for piece placability.<br>
  orientation - A number, is normalized internally for the number of orientations a given piece has. Used to check a given orientation   for placability.<br>
  
  
add_piece() - Assumes placability has already been checked.<br>
  Arguments<br>
  start_x - Starting x value to add add a piece to a board.<br>
  start_y - Starting y value to add a piece to a board.<br>
  board -   2D Array representation of the board to add the piece too.<br>
  orientation - The orientation to add to the board. Expects a valid orientation 0-orientations-1 for that piece<br>
  
  find_pieces() - Traverses a board and reports the total score given the number of the given piece on the board.<br>
    Arguments<br>
    board - the board to score for a given piece
