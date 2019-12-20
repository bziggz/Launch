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
  end
end

class Computer < Player
  include Evaluate
  TENDENCIES = {
    # 'Roberto' => %w(c c c c r l s p), # likes to stab => extra scissors
    # 'Robot Santa' => %w(r p c l s), # thinks every choice is equally as naughty
    # 'Bender' => %w(p), # won't do two things, paper is the only thing he can bend
    # 'Calculon' => %w(s s s s r l c), # overacts => extra spock : no script => no paper  
    'Robot Devil' => nil # illusion of fair choice, see computer.choose
  }

  def set_name
    self.name = TENDENCIES.keys.sample
  end

  def choose(other)
    choice = if name == 'Robot Devil'
      deal_with_the_devil(other)
    else
      TENDENCIES[name].sample
    end
    
    self.move = Move.new(choice).value
  end

  def deal_with_the_devil(other)
    case 
    when other.rock?      then ['p', 's'].sample
    when other.paper?     then ['c', 'l'].sample
    when other.scissors?  then ['p', 'r'].sample
    when other.lizard?    then ['r', 'c'].sample
    when other.spock?     then ['l', 'p'].sample
    end
  end
end

class Move
  CHOICES = %w(r p c l s)
  attr_reader :value

  def initialize(choice)
    @value = case choice
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

ben = Human.new
comp = Computer.new
ben.choose
puts "You move is #{ben.move}"
comp.choose(ben.move)
puts comp.move