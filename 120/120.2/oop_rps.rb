module Evaluator
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

class Rock
  include Evaluator

  def >(other_move)
    @action = 'crushes' if other_move.lizard? || other_move.scissors?
  end

  def to_s
    "Rock"
  end
end

class Paper
  include Evaluator

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
  include Evaluator

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
  include Evaluator

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
  include Evaluator

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

class Move
  CHOICES = {
    'r' => Rock,
    'p' => Paper,
    'c' => Scissors,
    'l' => Lizard,
    's' => Spock
  }

  attr_reader :value

  def initialize(choice)
    @value = CHOICES[choice].new
  end
end

class Personality
  attr_reader :name, :lose, :win

  def choose(_)
    tendancy.sample
  end

  def to_s
    name
  end
end

# Robot Devil give you the illusion of a fair game, see computer.choose
class RobotDevil < Personality
  include Evaluator
  WINNING_MOVES = {
    Rock => ['p', 's'],
    Paper => ['c', 'l'],
    Scissors => ['s', 'r'],
    Lizard => ['r', 'c'],
    Spock  => ['l', 'p']
  }

  def initialize
    @name = "Robot Devil"
  end

  def choose(other)
    WINNING_MOVES.each_pair do |type, choices|
      return choices.sample if other.class == type
    end
  end

  def lose
    ""
  end

  def win
    "\nAh, my ridiculously circuitous plan is one-quarter complete..."
  end
end

# Roberto likes to stab so extra scissors
class Roberto < Personality
  def initialize
    @name = "Roberto"
  end

  def tendancy
    %w(c c c c r l s p)
  end

  def lose
    "\nI need to stab someone! Where's my stabbing knife?!"
  end

  def win
    "\nWell, well, looks like old Roberto's the focus of attention now. "\
    "STOP LOOKING AT ME! Ha ha ha ha ha HAAAA!!!"
  end
end

# Bender won't do two things, can bend paper the easiest (laziest)
class Bender < Personality
  def initialize
    @name = "Bender"
  end

  def tendancy
    %w(p)
  end

  def lose
    "\nI’m so embarrassed, I wish everybody else was dead."
  end

  def win
    "\nYou know what cheers me up? Other people’s misfortune."
  end
end

# Calculon overacts so extra spock, and won't use a script so no paper
class Calculon < Personality
  def initialize
    @name = "Calculon"
  end

  def tendancy
    %w(s s s s r l c)
  end

  def lose
    "\nOh, how cruel and melodramatic fate is. WHYYYYY???"
  end

  def win
    "\nI'd like to thank the Academy, "\
    "my agent and most of all, my operating system."
  end
end

# Robot Santa thinks every choice is equally as naughty
class RobotSanta < Personality
  def initialize
    @name = "Robot Santa"
  end

  def tendancy
    %w(r p c l s)
  end

  def lose
    "\nI'll be back. Back when you least expect it: Next Xmas!"
  end

  def win
    "\nHo Ho Ho! It's time to get jolly on your naughty asses!"
  end
end

# Tinny Tim was created to lose.
class TinnyTim < Personality
  include Evaluator
  attr_reader :name
  LOSING_MOVES = {
    Rock => ['l', 'c'],
    Paper => ['r', 's'],
    Scissors => ['l', 'p'],
    Lizard => ['s', 'p'],
    Spock  => ['r', 'c']
  }

  def initialize
    @name = "Tinny Tim"
  end

  def choose(other)
    LOSING_MOVES.each_pair do |type, choices|
      return choices.sample if other.class == type
    end
  end

  def lose
    "\nYou raised my hopes and dashed them quite expertly, sir. Bravo!"
  end

  def win
    ""
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
  PERSONALITIES = [
    Roberto,
    RobotSanta,
    Bender,
    Calculon,
    RobotDevil,
    TinnyTim
  ]

  attr_reader :lose, :win

  def choose(other)
    self.move = Move.new(personality.choose(other)).value
    update_history
  end

  private

  attr_writer :lose, :win
  attr_reader :personality

  def set_personality
    @personality = PERSONALITIES.sample.new
  end

  def set_name
    set_personality
    self.name = personality.name
    self.lose = personality.lose
    self.win = personality.win
  end
end

class RPSMatch
  @@history = []

  def initialize
    clear_screen
    display_welcome_message
    @human = Human.new
    @computer = Computer.new
  end

  def play
    loop do
      game_sequence(set_match_length)
      display_match_winner
      break unless play_again?
      reset_match_score
      clear_screen
    end

    display_goodbye_message
  end

  def self.update_history(winner)
    @@history << winner
  end

  private

  attr_accessor :human, :computer, :winner, :score

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
    human_score = human.score
    computer_score = computer.score

    if human_score > computer_score
      puts "#{human.name} wins #{human_score}-#{computer_score} !!!"\
      "#{computer.lose}"
    else
      puts "#{computer.name} wins #{computer_score}-#{human_score} !!!"\
      "#{computer.win}"
    end
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

  def game_sequence(length)
    loop do
      clear_screen
      display_score
      Game.new(human, computer).play
      continue_match
      break if [human.score, computer.score].include?(length)
    end
  end
end

class Game < RPSMatch
  def initialize(human, computer)
    @human = human
    @computer = computer
  end

  def play
    human.choose
    computer.choose(human.move)
    determine_game_winner
    display_moves
    puts display_winner
    RPSMatch.update_history(display_winner)
    winner&.update_score
  end

  private

  attr_accessor :winner, :loser

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
end

RPSMatch.new.play
