# frozen_string_literal: true

require_relative './lib/board'
require_relative './lib/board_display'
require_relative './lib/pieces/piece'
require_relative './lib/pieces/slideable'
require_relative './lib/pieces/stepable'
require_relative './lib/pieces/null_piece'
require_relative './lib/pieces/bishop'
require_relative './lib/pieces/king'
require_relative './lib/pieces/knight'
require_relative './lib/pieces/pawn'
require_relative './lib/pieces/queen'
require_relative './lib/pieces/rook'
require_relative './lib/player'
require_relative './lib/game'
require_relative './lib/invalid_move_error'

b = Board.start_chess
g = Game.new(
  b,
  Player.new(:black),
  Player.new(:white),
  BoardDisplay
)
g.play
