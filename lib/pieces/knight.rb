class Knight < Piece

  def to_s
    color == :black ? "♞" : "♘"
  end

  def move_dirs
    [
      [1, 2],
      [2, 1],
      [-1, 2],
      [-2, 1],
      [1, -2],
      [2, -1],
      [-1, -2],
      [-2, -1],  
    ]
  end
end