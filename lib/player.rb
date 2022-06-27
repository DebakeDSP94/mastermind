# frozen_string_literal: true

# Creates player instance
class Player
  attr_accessor :name, :creator

  def initialize(name)
    @name = name
    @creator = ''
  end

  def assign_name
    $stdout.puts "#{name} What is your name?"
    @name = gets.chomp
  end

  def assign_creator
    $stdout.puts "#{name} Do you want to create or solve?"
    $stdout.puts '1. Create'
    $stdout.puts '2. Solve'
    @creator = gets.chomp
  end
end
