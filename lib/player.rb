# frozen_string_literal: true

class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def get_pos
    gets
      .chomp
      .split(',')
      .map(&:to_i)
  end
end
