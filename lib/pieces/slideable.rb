# frozen_string_literal: true

module Slideable
  def available_moves
    moves = []

    move_dirs.each do |(dr, dc)|
      current_r, current_c = location

      loop do
        current_r += dr
        current_c += dc
        loc = [current_r, current_c]
        break unless board.in_bounds?(loc)

        moves << loc if board.empty?(loc)
        if enemy?(loc)
          moves << loc
          break
        end
      end
    end
    moves
  end
end
