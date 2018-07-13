# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
  All_My_Pieces = All_Pieces + [[[[0, 0], [-1, 0], [1, 0], [2, 0], [-2, 0]], # extralong (only needs two)
               [[0, 0], [0, -1], [0, 1], [0, 2], [0, -2]]],
               rotations([[0, 0], [1, 0], [-1, 0], [0, -1], [-1, -1]]), # first new
               rotations([[0, 0], [1, 0], [0, 1]])] # last new

  def self.next_piece (board)
    MyPiece.new(All_Pieces.sample, board)
  end

end

class MyBoard < Board
 
  def initialize(game)
    super
    @current_block = MyPiece.next_piece(self)
    @cheating = false
  end

  def cheating
    @cheating
  end

  def next_piece
    @current_block = MyPiece.next_piece(self)
    @current_pos = nil
  end

  def rotate_twice  # coud have used rotate_clockwise twice, but that would draw pice twice
    if !game_over? and @game.is_running?
      @current_block.move(0, 0, 2)
    end
    draw
  end

  def cheat
    if not cheating and score >= 100
      @score -= 100
      @game.update_score
      @cheating = true
    end
  end

  def next_piece
    if not cheating
      super
    else
      @current_block = MyPiece.new([[[0, 0]]], self)
      @current_pos = nil
      @cheating = false
    end
  end

  def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    (0..locations.size-1).each{|index| 
      current = locations[index];
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] = 
      @current_pos[index]
    }
    remove_filled
    @delay = [@delay - 2, 80].max
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
    @root.bind('c', proc {@board.cheat})
  end
end

