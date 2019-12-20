require 'pry'
require 'pry-byebug'

module Evaluate
  attr_reader :action

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

class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    set_name
    @score = 0
    @history = []
  end

  def update_score
    self.score += 1
  end

  def player_score
    "#{name}: #{score}"
  end

  def update_history
    history << move.to_s
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

    self.move = Move.new(choice).value
    update_history
  end
end

class Computer < Player
  include Evaluate
  PERSONALITIES = {
    'Roberto' => %w(c c c c r l s p),
    # Roberto likes to stab so extra scissors
    'Robot Santa' => %w(r p c l s),
    # Robot Santa thinks every choice is equally as naughty
    'Bender' => %w(p),
    # Bender won't do two things, can bend paper the easiest (laziest)
    'Calculon' => %w(s s s s r l c),
    # Calculon overacts so extra spock, and won't use a script so no paper
    'Robot Devil' => nil
    # Robot Devil give you the illusion of a fair game, see computer.choose
  }

  def set_name
    self.name = PERSONALITIES.keys.sample
  end

  def choose(other)
    choice =  if name == 'Robot Devil'
                deal_with_the_devil_with_you(other)
              else
                PERSONALITIES[name].sample
              end

    self.move = Move.new(choice).value
    update_history
  end

  private

  def deal_with_the_devil_with_you(other)
    case
    when other.rock?      then ['p', 's'].sample
    when other.paper?     then ['c', 'l'].sample
    when other.scissors?  then ['s', 'r'].sample
    when other.lizard?    then ['r', 'c'].sample
    when other.spock?     then ['l', 'p'].sample
    end
  end
end

class Move
  CHOICES = %w(r p c l s)
  attr_reader :value

  def initialize(choice)
    @value =  case choice
              when 'r' then Rock.new
              when 'p' then Paper.new
              when 'c' then Scissors.new
              when 'l' then Lizard.new
              when 's' then Spock.new
              end
  end
end

class Rock
  include Evaluate

  def >(other_move)
    @action = 'crushes' if other_move.lizard? || other_move.scissors?
  end

  def to_s
    "Rock"
  end
end

class Paper
  include Evaluate

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

class Scissors
  include Evaluate

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

class Lizard
  include Evaluate

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

class Spock
  include Evaluate

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
  @@history = []

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
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def set_match_length
    answer = nil

    loop do
      puts "How many games needed to win the match?"
      answer = gets.chomp.strip

      break if answer =~ /^[0-9]+$/ && answer.to_i > 0

      if answer.to_i == 0
        puts "You have to play at least one game."
      else
        puts "Invalid Entry."
      end
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

  def self.update_history(winner)
    @@history << winner
  end

  def display_history
    puts "#{human.name.center(15)}|#{computer.name.center(15)}"\
    "|      Outcome     "

    puts "-" * 50

    human.history.each_with_index do |move, idx|
      puts "#{move.center(15)}|#{computer.history[idx].center(15)}"\
      "|#{@@history[idx].center(18)}"
    end

    puts "\nPress ENTER to continue."
    gets
  end

  def continue_match
    puts "Enter 'h' to see move history, or any other key to continue."
    display_history if gets.chomp.downcase.start_with?('h')
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
  attr_accessor :winner, :loser

  def initialize(human, computer)
    @human = human
    @computer = computer
  end

  def display_moves
    puts "#{human.name} chose #{human.move}. "\
    "#{computer.name} chose #{computer.move}."

    if winner && winner.move.rock? && loser.move.scissors?
      puts "As it always has, "\
      "#{winner.move} #{winner.move.action} #{loser.move}."
    elsif winner
      puts "#{winner.move} #{winner.move.action} #{loser.move}."
    end
  end

  def determine_game_winner
    if human.move > computer.move
      @winner = human
      @loser = computer
    elsif computer.move > human.move
      @winner = computer
      @loser = human
    end
  end

  def display_winner
    case winner
    when human    then  "#{human.name} won!"
    when computer then  "#{computer.name} won!"
    else                "It's a tie."
    end
  end

  def play
    human.choose
    computer.choose(human.move)
    determine_game_winner
    display_moves
    puts display_winner
    RPSMatch.update_history(display_winner)
    winner.update_score if winner
  end
end

RPSMatch.new.play
