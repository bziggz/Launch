class GuessingGame
  def initialize(low, high)
    @range = (low..high)
    @range_display = "#{low} and #{high}"
    @target = @range.to_a.sample
    @guesses = Math.log2(size_of_range).to_i + 1
  end


  def play
    loop do 
      puts "You have #{@guesses} guesses remaining."

      loop do
        puts "Please enter a number between #{@range_display}:"
        @guess = gets.chomp.to_i
        break if valid_guess?
        puts "Invalid answer. Please enter a number between #{@range_display}:"
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
    @range.include?(@guess)
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

  def size_of_range
    range = @range.to_a
    range.last - range.first
  end
end

game = GuessingGame.new(200, 1000)

game.play


