require_relative 'outputs'

# class Game - handles initializing the game and player turns
class Game
  include Outputs
  attr_accessor :board, :player1, :player2, :validated, :player_turn, :tied, :win
  attr_reader :win_sets

  def initialize
    @board = Board.new
    @player = nil
    @validated = nil
    @player_guess_count = 0
    @win = false
    @colors = []
    
  end

  def play
    make_player
    instructions
    board.display_board
    play_turn(player)
  end

  def make_player
    @player = Player.new('player')
    player.assign_name
    player.assign_creator
  end

  def play_turn(player)
    pick_colors(player)
    check_for_win(player)
  end

  def player_turn(player)
    do 4.times
    color = $stdin.gets.chomp.downcase
    colors << color
    @validated = board.validate_input(player_choice, player)
    msg_out(validated)
    @player_guess_count += 1 if @validated == 'valid'
  end

  def msg_out(validated)
    system 'clear' || 'cls'
    board.display_board
    invalid_input if validated == 'invalid'
  end

  def check_for_win(player)
    if player_guess_count == 12
      computer_win
   else
    play_turn(player) unless @win == true
   end
  end
end
