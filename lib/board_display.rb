# frozen_string_literal: true

class BoardDisplay
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def render
    columns = %w[a b c d e f g h]
    rows = [8, 7, 6, 5, 4, 3, 2, 1]

    puts "    #{columns.join('   ')}"
    puts "  +#{'---+' * 8}"

    rows.each_with_index do |row, i|
      print "#{row} |"
      8.times do |j|
        print " #{board[[i, j]]} |"
      end
      puts " #{row}"
      puts "  +#{'---+' * 8}"
    end

    puts "    #{columns.join('   ')}"
  end
end
