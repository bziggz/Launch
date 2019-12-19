require 'pry'
require 'pry-byebug'

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def update_score
    self.score += 1
  end

  def player_score
    "#{name}: #{score}"
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp.strip
      break unless n.empty?
      puts "Must enter something."
    end

    self.name = n
  end

  def choose
    choice = nil

    loop do
      puts "Please choose (R)ock, (P)aper, s(C)issors, (L)izard, or (S)pock:"
      choice = gets.chomp.downcase
      break if Move::CHOICES.include?(choice)
      puts "Invalid Entry."
    end
    puts "You chose #{choice}"
    # binding.pry
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = "The Computer"
  end

  def choose
    choice = Move::CHOICES.sample
    puts "The Computer chose #{choice}"
    self.move = Move.new(choice)
  end
end

class Move
  CHOICES = ['r', 'p', 'c', 'l', 's']

  def initialize(choice)
    case choice
    when 'r' then Rock.new
    when 'p' then Paper.new
    when 'c' then Scissors.new
    when 'l' then Lizard.new
    when 's' then Spock.new
    end
  end

  def scissors?
    self.class == Scissors
  end

  def rock?
    self.class == Rock
  end

  def paper?
    self.class == Paper
  end

  def lizard?
    self.class == Lizard
  end

  def spock?
    self.class == Spock
  end
end

class Rock < Move
  def >(other_move)
    @action = 'crushes' if other_move.lizard? || other_move.scissors?
  end

  def to_s
    "Rock"
  end
end

class Paper < Move
  def >(other_move)
    @action = if other_move.rock?
                'covers'
              elsif other_move.spock?
                'disproves'
              end
  end

  def to_s
    "Paper"
  end
end

class Scissors < Move
  def >(other_move)
    @action = if other_move.paper?
                'cuts'
              elsif other_move.lizard?
                'decapitates'
              end
  end

  def to_s
    "Scissors"
  end
end

class Lizard < Move
  def >(other_move)
    @action = if other_move.spock?
                'poisons'
              elsif other_move.paper?
                'eats'
              end
  end

  def to_s
    "Lizard"
  end
end

class Spock < Move
  def >(other_move)
    @action = if other_move.rock?
                'vaporizes'
              elsif other_move.scissors?
                'smashes'
              end
  end

  def to_s
    "Spock"
  end
end

class RPSMatch
  attr_accessor :human, :computer, :winner, :score

  def initialize
    clear_screen
    display_welcome_message
    @human = Human.new
    @computer = Computer.new
  end

  def clear_screen
    Gem.win_platform? ? (system "cls") : (system "clear")
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def set_match_length
    answer = nil

    loop do
      puts "How many games needed to win the match?"
      answer = gets.chomp.strip
      break if answer =~ /^[0-9]+$/ && answer.to_i > 0
      puts answer.to_i == 0 ? "You have to play at least one game." :
        "Invalid Entry."
    end

    answer.to_i
  end

  def display_score
    puts "#{human.player_score} ||| #{computer.player_score}"
  end

  def display_match_winner
    if human.score > computer.score
      puts "#{human.name} wins #{human.score}-#{computer.score} !!!"
    else
      puts "#{computer.name} wins #{computer.score}-#{human.score} !!!"
    end
  end

  def continue_match
    puts "Press Enter to continue."
    gets
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock! Go Bucks!!!"
  end

  def reset_match_score
    human.score = 0 
    computer.score = 0 
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Invalid Entry."
    end

    answer.downcase == 'y'
  end

  def play
    loop do
      length = set_match_length

      loop do
        clear_screen
        display_score
        Game.new(human, computer).play
        continue_match
        break if [human.score, computer.score].include?(length)
      end

      display_match_winner
      break unless play_again?
      reset_match_score
      clear_screen
    end


    display_goodbye_message
  end
end

class Game < RPSMatch
  attr_accessor :winner

  def initialize(human, computer)
    @human = human
    @computer = computer
  end

  def display_moves
    puts "#{human.name} chose #{human.move}. "\
    "#{computer.name} chose #{computer.move}."
    puts "#{winner.move} #{winner.move.action} #{loser.move}"
  end

  def determine_game_winner
    if human.move > computer.move
      @winner, @loser = human, computer
    elsif computer.move > human.move
      @winner, @loser = computer, human
    end
  end

  def display_winner
    puts case winner
    when human    then  "#{human.name} won!"
    when computer then  "#{computer.name} won!"
    else                "It's a tie."
    end
  end

  def play
    human.choose
    computer.choose
    determine_game_winner
    display_moves
    display_winner
    winner.update_score if winner
  end
end

RPSMatch.new.play

