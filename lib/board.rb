class Board
  attr_reader :grid

  def self.start_chess
    board = self.new
  end

  def initialize
    @grid = Array.new(8) { Array.new(8, NullPiece.instance) }
  end

  def []=(location, piece)
    row, column = location
    grid[row][column] = piece
  end
      
  def [](location)
    row, column = location
    grid[row][column]
  end
    
  def in_bounds?(location)
    row, column = location
    
    row < grid.length && 
      column < grid.first.length &&
      row >= 0 &&
      column >= 0
  end

  def empty?(location)
    row, column = location
    grid[row][column] == NullPiece.instance
  end

  def pieces
    grid.flatten.reject {|piece| piece.is_a?(NullPiece) }
  end

  def move_piece(start_pos, end_pos)
    # validate that end pos is in safe moves
    piece = self[start_pos]
    if !piece.safe_moves.include?(end_pos)
      raise InvalidMoveError.new(
        "End position (#{end_pos}) not in available moves: #{piece.safe_moves}"
      )
    end
    if !in_bounds?(end_pos)
      raise InvalidMoveError.new('End position not in bounds')
    end
    move_piece!(start_pos, end_pos)
  end

  def move_piece!(start_pos, end_pos)
    # remove the piece from the baord at the current location
    # place the piece on the board at the new location
    self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]

    # update the piece's internal location with end pos
    self[end_pos].location = end_pos
  end

  def dup
    new_board = Board.new
    pieces.each do |piece|
      new_piece = piece.class.new(
        new_board, 
        piece.location, 
        piece.color
      )
      new_board[new_piece.location] = new_piece
    end
    new_board
  end
end