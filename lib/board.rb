# frozen_string_literal: true

require_relative 'game'

# handles game board functionality
class Board
  attr_accessor :board

  def initialize
    @board = []
  end

  def display_board
    puts " #{@board}  Matches = #{matches}  Partials = #{partials}"
  end

  def validate_input(player_choice, player)
    return 'invalid' unless ('r', 'o', 'y', 'g', 'b', 'p').include?(player_choice)

    'valid'
    end
  end
end