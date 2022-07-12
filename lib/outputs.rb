# frozen_string_literal: true

# module contains the text outputs for the game
module Outputs
  def instructions
    $stdout.puts "Welcome to Mastermind!\n"
    $stdout.puts "You will be given a random code to guess.\n"
    $stdout.puts "you will be given 12 guesses to guess the code.\n"
    $stdout.puts "You will be given a feedback on how close your guess is.\n"
    $stdout.puts "There are 6 colors to choose from and 4 slots on each row to guess.\n"
    $stdout.puts "The colors are: red, orange, yellow, green, blue, purple.\n"
  end

  def pick_colors_msg
    $stdout.puts 'Please select four colors'
    $stdout.puts "enter 'r' for red, 'o' for orange,'y' for yellow, 'g' for green, 'b' for blue, or 'p' for purple"
    $stdout.puts 'enter your choices followed by the enter key after each choice'
  end

  def invalid_input
    $stdout.puts 'Invalid input. Please try again'
  end

  def player_win
    $stdout.puts "#{player.name} is the winner! You have solved in #{player_guess_count} moves!"
  end

  def player_lose
    $stdout.puts "#{player.name} was unable to break the code in 12 moves or less.  They have lost."
    $stdout.puts "The code was #{color_out}"
  end

  def computer_win
    $stdout.puts 'The computer is the winner!'
  end

  def computer_lose
    $stdout.puts 'The computer was unable to crack the code in 12 moves or less.  You win.'
  end
end
