# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here

  All_Pieces = [
    #   [[[0, 0], [1, 0], [0, 1], [1, 1]]],  # square (only needs one)
    #            rotations([[0, 0], [-1, 0], [1, 0], [0, -1]]), # T
    #            [[[0, 0], [-1, 0], [1, 0], [2, 0]], # long (only needs two)
    #            [[0, 0], [0, -1], [0, 1], [0, 2]]],
    #            rotations([[0, 0], [0, -1], [0, 1], [1, 1]]), # L
    #            rotations([[0, 0], [0, -1], [0, 1], [-1, 1]]), # inverted L
    #            rotations([[0, 0], [-1, 0], [0, -1], [1, -1]]), # S
    #            rotations([[0, 0], [1, 0], [0, -1], [-1, -1]]),# Z
            #    [[[0, 0], [-1, 0], [1, 0], [2, 0], [-2, 0]], # extralong (only needs two)
            #    [[0, 0], [0, -1], [0, 1], [0, 2], [0, -2]]],
            #     rotations([[0, 0], [1, 0], [-1, 0], [0, -1], [-1, -1]]), # first new
                 rotations([[0, 0],[0, 1], [-1, 0] ])
            ] 
  def self.next_piece (board)
    MyPiece.new(All_Pieces.sample, board)
  end
end

class MyBoard < Board
  # coud have used rotate_clockwise twice, but that would draw pice twice
  def initialize(game)
    super
    @current_block = MyPiece.next_piece(self)
  end

  def next_piece
    @current_block = MyPiece.next_piece(self)
    @current_pos = nil
  end

  def rotate_twice
    if !game_over? and @game.is_running?
      @current_block.move(0, 0, 2)
    end
    draw
  end

end

class MyTetris < Tetris

  def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end

  def key_bindings
    super
    @root.bind('u', proc {@board.rotate_twice})
  end

end

