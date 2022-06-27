# frozen_string_literal: true

# require_relative 'game'

# handles game board functionality
class Board
  attr_accessor :board, :color_out

  def initialize
    @board = []
    @color_out = []
  end

  def display_board(colors, matches, partials)
    convert(colors)
    @board << " #{@color_out}  Matches = #{matches}  Partials = #{partials}"
    puts @board
  end

  def validate_input(player_choice)
    return 'invalid' unless %w[r o y g b p].include?(player_choice)

    'valid'
  end

  def convert(colors)
    @color_out = []
    colors.each do |color|
      convert_color(color)
    end
  end

  def convert_color(color)
    case color
    when 1 then @color_out.push('Red')
    when 2 then @color_out.push('Orange')
    when 3 then @color_out.push('Yellow')
    when 4 then @color_out.push('Green')
    when 5 then @color_out.push('Blue')
    when 6 then @color_out.push('Purple')
    end
  end
end
