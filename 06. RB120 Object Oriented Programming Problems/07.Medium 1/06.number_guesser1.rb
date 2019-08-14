require 'pry'

class GuessingGame

  private 

  attr_reader :winning_number

  public

  attr_accessor :current_guess
  attr_reader :guesses_left

  def initialize
    @winning_number = (1..100).to_a.sample
    @guesses_left = 7
    @current_guess = nil
  end

  def play
    loop do
      print_guesses_remaining
      prompt_player
      give_feedback
      break if player_won? || player_lost?
    end
  end

  def print_guesses_remaining
    puts "You have #{guesses_left} guesses remaining."
  end

  def prompt_player
    loop do
      print "Enter a number between 1 and 100: "
      self.current_guess = gets.chomp.to_i
      break if valid?(current_guess)
      print "Invalid guess. "
    end
    @guesses_left -= 1
  end

  def valid?(current_guess)
    (1..100).to_a.include?(current_guess)
  end

  def give_feedback
    puts "Your guess is too low." if current_guess < winning_number
    puts "Your guess is too high." if current_guess > winning_number
    puts "You won!" if player_won?
  end

  def player_won?
    winning_number == current_guess
  end

  def player_lost?
    puts "\nYou have no more guesses. You lost!" if guesses_left == 0
    guesses_left == 0
  end
end

game = GuessingGame.new
game.play


