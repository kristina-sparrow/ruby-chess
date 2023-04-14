class Board
  attr_reader :grid

  def self.start_chess
    board = self.new
  end

  def initialize
    @grid = Array.new(8) { Array.new(8) }
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
end