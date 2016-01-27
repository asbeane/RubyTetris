# RubyTetris
Ruby Tetris Board Scorer

This is a board scorer for Tetris where pieces can only touch on diagonals.

How to run: (Expects all Command Line Arguments to be present).
  ruby main.rb &nbsp; [arg1]&nbsp; [arg2] &nbsp;[arg3]<br>
  Example: ruby main.rb &nbsp; 5 &nbsp; 0 &nbsp; 1<br>
  &nbsp;&nbsp; This would simulate and score 5 boards, not print the initial board, but would print the filled board.<br>
  arg1 - number of boards to score/simulate <br>
  arg2 - If 1, For each board, draw the initial empty board to the terminal/prompt in ascii characters.<br>
  arg2 - If 1  For each board, draw the filled board with pieces.<br>
  
  *Program expects all files to be located in same directory.<br>
  *Uses No External libraries. Only included files are the ones created as part of the program.<br>

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
    
Each of the Piece classes have the same 3 public functions, plus 1 private helper, implemented.

Public Methods:<br>
can_place() - Arguments<br>
  &nbsp;start_x: Starting X coordinate to check if the Piece is placable on the board.<br>
  &nbsp;start_y: Starting Y coordinate to check if the Piece is placable on the board.<br>
  &nbsp;board: 2D Array, which is the array describing the board to be checked for piece placability.<br>
  &nbsp;orientation - A number, is normalized internally for the number of orientations a given piece has. Used to check a given &nbsp;orientation for placability.<br>
  
  
add_piece() - Assumes placability has already been checked.<br>
  &nbsp;Arguments<br>
  &nbsp;start_x - Starting x value to add add a piece to a board.<br>
  &nbsp;start_y - Starting y value to add a piece to a board.<br>
  &nbsp;board -   2D Array representation of the board to add the piece too.<br>
  &nbsp;orientation - The orientation to add to the board. Expects a valid orientation 0-orientations-1 for that piece<br>
  
  find_pieces() - Traverses a board and reports the total score given the number of the given piece on the board.<br>
    &nbsp;Arguments<br>
    &nbsp;board - the board to score for a given piece<br>
    
    Additions that could be made:
      Add more piece types with the same structure as the existing pieces.
