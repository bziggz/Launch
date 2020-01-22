class GuessingGame
  attr_reader :target
  attr_accessor :guesses

  def initialize
    @target = (1..100).to_a.sample
    @guesses = 7
  end


  def play
    loop do 
      puts "You have #{guesses} guesses remaining."

      loop do
        puts "Please enter a number between 1 and 100:"
        @guess = gets.chomp.to_i
        break if valid_guess?
        puts "Invalid answer. Please enter a number between 1 and 100:"
      end

      puts result
      puts "\n"
      break if result == "That's the number!"

      @guesses -= 1
      if @guesses == 0
        puts "You have no more guesses. You lost!"
        break
      end
    end
  end

  def valid_guess?
    (1..100).include?(@guess)
  end

  def result
    if @guess < @target
      "Your guess is too low."
    elsif @guess > @target
      "Your guess is too high."
    else
      "That's the number!"
    end
  end
end

game = GuessingGame.new

game.play