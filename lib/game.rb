# frozen_string_literal: true

require_relative 'outputs'

# class Game - handles initializing the game and player turns
class Game
  include Outputs
  attr_accessor :board, :player, :validated, :colors, :win, :player_guess_count, :code, :solved, :partials, :matches

  def initialize
    @board = Board.new
    @player = nil
    @validated = nil
    @player_guess_count = 0
    @win = false
    @solved = false
    @code = []
    @partials = 0
    @matches = 0
    @computer_code = []
  end

  def play
    make_player
    instructions
    if player.creator == '1'
      pick_colors
      @code = @colors
      computer_solve
    else
      make_computer_code
      play_turn
    end
  end

  def make_player
    @player = Player.new('player')
    player.assign_name
    player.assign_creator
  end

  def play_turn
    @colors = []
    pick_colors
    @player_guess_count += 1
    check_for_win
  end

  def pick_colors
    pick_colors_msg
    while @colors.length < 4
      color = $stdin.gets.chomp.downcase
      @validated = board.validate_input(color)
      invalid_input if @validated == 'invalid'
      convert(color) if @validated == 'valid'
    end
  end

  def convert(color)
    case color
    when 'r' then @colors.push(1)
    when 'o' then @colors.push(2)
    when 'y' then @colors.push(3)
    when 'g' then @colors.push(4)
    when 'b' then @colors.push(5)
    when 'p' then @colors.push(6)
    end
  end

  def make_computer_code
    4.times do
      computer_pick = rand(1..6)
      @computer_code << computer_pick
    end
  end

  def check_for_win
    puts "player guess count is #{player_guess_count} "
    if @player_guess_count == 12 && @solved == false
      player_lose
    else
      check_for_solved
      player_win if win == true
      play_turn unless @win == true
    end
  end

  def check_for_solved
    @matches = 0
    @partials = 0
    compute_matches
    board.display_board(@colors, @matches, @partials)
    @win = true if @matches == 4
  end

  def compute_matches
    @colors.each_with_index do |color, idx|
      if @computer_code.include?(color) && @computer_code[idx] != @colors[idx]
        @partials += 1
      elsif @computer_code[idx] == @colors[idx]
        @matches += 1
      end
    end
  end

  def computer_solve
    puts 'computer trying to solve'
  end
end
