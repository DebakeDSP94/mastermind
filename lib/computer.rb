# frozen_string_literal: true

require_relative 'game'

# creates computer class object for computer solver portion of the game
class Computer < Game
  attr_accessor :computer_sets, :comp_win, :computer_count, :computer_guess, :board

  def initialize(colors = [])
    @computer_guess = [1, 2, 3, 4]
    @computer_sets = []
    @computer_count = 0
    @comp_win = false
    @colors = colors
    @board = []
  end

  def computer_solve
    create_sets
    check_for_comp_lose
  end

  def play_comp_turn
    comp_check_guess
    system 'clear' || 'cls'
    display_board(@computer_guess, @matches, @partials)
    @computer_count += 1
    puts "Computer turn count is #{@computer_count}"
    computer_win if @comp_win == true
    return if @comp_win == true

    eliminate_impossibles
    @computer_guess = @computer_sets.sample
    check_for_comp_lose
  end

  def check_for_comp_lose
    computer_lose if @computer_count >= 20
    return if @computer_count >= 20

    play_comp_turn unless @comp_win == true
  end

  def create_sets
    for i in (1..6) do
      for j in (1..6) do
        for k in (1..6) do
          for l in (1..6) do
            set = [i, j, k, l]
            @computer_sets.push(set)
          end
        end
      end
    end
  end

  def eliminate_impossibles
    indexes_to_delete = []
    @computer_sets.each_with_index do |set, idx|
      indexes_to_delete << idx unless comp_check_match(set) == comp_check_guess
    end
    @computer_sets.delete_if.with_index { |_e, i| indexes_to_delete.include? i }
    sleep 1
  end

  def comp_check_match(set)
    @partials = 0
    @matches = 0
    set.each_with_index do |elem, idx|
      if @computer_guess[idx] == set[idx]
        @matches += 1
      elsif @computer_guess.include?(elem) && @computer_guess[idx] != set[idx]
        @partials += 1
      end
    end
    [@partials, @matches]
  end

  def comp_check_guess
    @partials = 0
    @matches = 0
    @colors.each_with_index do |elem, idx|
      if @colors[idx] == @computer_guess[idx]
        @matches += 1
      elsif @computer_guess.include?(elem) && @colors[idx] != @computer_guess[idx]
        @partials += 1
      end
    end
    @comp_win = true if @computer_guess == @colors
    [@partials, @matches]
  end
end
