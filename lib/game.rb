# frozen_string_literal: true

class Game
  attr_reader :player1, :player2, :board, :display
  attr_accessor :current_player

  def initialize(board, player1, player2, display)
    @board = board
    @display = display.new(board)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def swap_player!
    self.current_player = (current_player == player1 ? player2 : player1)
  end

  def play
    until over?
      display.render
      puts "It's #{current_player.color}'s turn"
      puts "#{current_player.color} is in check." if board.in_check?(current_player.color)

      take_turn
      swap_player!
    end

    swap_player!
    puts "Game over! The winner is: #{current_player.color}"
    display.render
  end

  def over?
    board.checkmate?(current_player.color)
  end

  def take_turn
    start_pos = nil
    # Prompt current player to enter a starting pos
    loop do
      puts 'Select a piece to move: '
      start_pos = current_player.get_pos
      break if board[start_pos].color == current_player.color

      puts "Did not select a #{current_player.color} piece."
    end

    # Prompt current player to enter an ending pos
    loop do
      puts 'Select a position to move to:'
      end_pos = current_player.get_pos

      # Move the piece
      begin
        board.move_piece(start_pos, end_pos)
        break
      rescue InvalidMoveError => e
        puts e.message
      end
    end
  end
end
