require 'pry'
require 'pry-byebug'

module Clearable
  def clear_screen
    Gem.win_platform? ? (system "cls") : (system "clear")
  end
end

class Card
  attr_reader :rank, :suit
  attr_accessor :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = Deck::RANKS[rank]
  end
end

class Deck
  SUITS = [
    "\xE2\x99\xA0",
    "\xE2\x99\xA3",
    "\xE2\x99\xA5",
    "\xE2\x99\xA6"
  ].freeze

  RANKS = {
    "2 " => 2, "3 " => 3, "4 " => 4, "5 " => 5, "6 " => 6, "7 " => 7,
    "8 " => 8, "9 " => 9, "10" => 10, "J " => 10, "Q " => 10, "K " => 10,
    "A " => 11
  }.freeze

  attr_reader = :deck
  def initialize
    @deck = RANKS.keys.product(SUITS)
  end

  def *(num)
    @deck * num
  end
end

class Shoe
  NUMBER_OF_DECKS = 8

  def initialize
    reset
  end

  def reset
    @shoe = Deck.new * NUMBER_OF_DECKS
  end

  def draw
    reset if @shoe.empty?
    card = @shoe.sample
    @shoe.delete(card)
    Card.new(card[0], card[1])
  end
end


class Hand
  include Comparable
  attr_accessor :hand, :ranks, :suits, :size, :values, :score

  def initialize
    @hand = []
    @size = 0
  end

  def <<(card)
    hand << card
    format_for_display
    @size = hand.size
    @score = determine_score
  end


  def format_for_display
    @ranks = hand.map { |card| "#{card.rank.ljust(3)}"}
    @suits = hand.map { |card| "#{card.suit.rjust(3)}"}
  end

  def determine_score
    values = hand.map { |card| card.value }

    values.map! do |value|
      value == 11 && values.sum > Match::TARGET ? 1 : value
    end

    values.sum
  end

  def <=>(other)
    self.score <=> other.score
  end

  def show_cards(face_up = true)
    if face_up == false && size >= 2 
      @ranks[-1] = '   ' 
      @suits[-1] = ' ? ' 
    end

    puts "\n"
    puts "  ___ " * size
    print " |#{@ranks.shift}|" until @ranks == nil || @ranks.empty?
    puts ""
    print " |#{@suits.shift}|" until @suits == nil || @suits.empty?
    puts ""
    puts " |___|" * size
    puts "\n"

    format_for_display
  end
end

class Player
  attr_accessor :hand, :match_score, :name, :shoe

  def initialize
    set_name
    @hand = Hand.new
    @match_score = 0
  end

  def update_match_score 
    self.match_score += 1
  end

  def player_score
    "#{name}: #{match_score}"
  end

  def busted?
    hand.score > Match::TARGET
  end

  def blackjack?
    hand.score == Match::TARGET && hand.size == Match::BLACKJACK_COUNT
  end

  def take_hit?
    busted? || blackjack? || hit_or_stay?
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

  def hit_or_stay?
    answer = nil
    loop do 
      puts %(Do you want to Hit or Stay?
      1 - Hit
      2 - Stay)
      answer = gets.chomp.to_i
      break if [1, 2].include?(answer)
      display_table
      puts "Invalid Choice"
    end
    answer == 2
  end

end

class Dealer < Player
  def hit_or_stay?
    sleep(0.8)
    hand.score >= 17
  end

  def set_name
    self.name = ["Abed", "Troy", "Jeff", "Britta", "Annie", "Shirley", "Pierce"].sample
  end
end

class Game
  include Clearable
  attr_reader :shoe, :human, :dealer, :outcome

  def play
    turn(human)
    turn(dealer) unless human.blackjack? || human.busted?
    @outcome = determine_game_outcome
    display_table
    display_game_outcome
    keep_score
    reset_table
  end

  def initialize(shoe, human, dealer)
    @shoe = shoe
    @human = human
    @dealer = dealer
    display_table(false, false)
    deal_opening_hand
  end

  def deal_opening_hand
    2.times do
      sleep(0.75)
      deal(human)
      display_table(false, false)
      sleep(0.75)
      deal(dealer)
      display_table(false, false)
    end
  end

  def reset_table
    human.hand = Hand.new
    dealer.hand = Hand.new
  end

  def deal(player)
    player.hand << shoe.draw
  end

  def turn(player)
    loop do
      player == human ? display_table(false, false) : display_table
      break if player.take_hit?
      deal(player)
    end
  end

  def compare_cards
    if human.hand.score > dealer.hand.score
      :human_win
    elsif human.hand.score < dealer.hand.score
      :dealer_win
    else
      :push
    end
  end

  def determine_game_outcome
    if human.blackjack?
      :human_blackjack
    elsif human.busted?
      :human_bust
    elsif dealer.blackjack?
      :dealer_blackjack
    elsif dealer.busted?
      :dealer_bust
    else
      compare_cards
    end
  end

  def display_game_outcome
    puts  case @outcome
          when :human_blackjack then "Blackjack!!! You win!!!"
          when :human_bust then "You Bust!!!"
          when :dealer_blackjack then "The Dealer has Blackjack. The Dealer Wins."
          when :dealer_bust then "The Dealer Busts! You win!!!"
          when :human_win then "You win!!!"
          when :dealer_win then "The Dealer wins."
          when :push then "Push."
          end
  end

  def determine_game_winner
    case @outcome
    when :human_blackjack, :dealer_bust, :human_win then :human
    when :human_bust, :dealer_blackjack, :dealer_win then :dealer
    end
  end

  def keep_score
    case determine_game_winner
    when :human then human.update_match_score
    when :dealer then dealer.update_match_score
    end
  end

    def display_score
    puts "#{human.player_score} ||| #{dealer.player_score}"
  end

  def display_table(face_up = true, show_score = true)
    show_score ? dealer_total = dealer.hand.score : dealer_total = '??'

    clear_screen
    display_score
    dealer.hand.show_cards(face_up)
    puts "#{dealer.name}'s Total: #{dealer_total}"
    puts "-------------------------------"
    puts "#{human.name}'s Total: #{human.hand.score}"
    human.hand.show_cards
  end
end

class Match
  include Clearable
  TARGET = 21
  DEALER_STAY = TARGET - 4
  BLACKJACK_COUNT = if TARGET <= 11
                      1
                    elsif TARGET <= 44
                      TARGET / 11 + 1
                    else
                      (TARGET - 35) / 10
                    end

  def initialize(shoe)
    clear_screen
    display_welcome_message
    @shoe = shoe
    @human = Human.new
    @dealer = Dealer.new
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

  private

  attr_accessor :human, :dealer, :winner, :score, :first_player, :shoe

  def display_welcome_message
    puts "Welcome to 21!!!"
    puts "\n"
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

  def display_match_winner
    human_score = human.match_score
    dealer_score = dealer.match_score

    if human_score > dealer_score
      puts "#{human.name} wins #{human_score}-#{dealer_score} !!!"
    else
      puts "#{dealer.name} wins #{dealer_score}-#{human_score} !!!"
    end
    puts "\n"
  end

  def continue_match
    puts "\n"
    puts "Press Enter to continue."
    gets
  end

  def reset_match_score
    human.match_score = 0
    dealer.match_score = 0
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

  def display_goodbye_message
    clear_screen
    puts "Thanks for playing 21! Go Bucks!!!"
    puts "\n"
  end

  def game_sequence(match_length)
    loop do
      clear_screen
      Game.new(shoe, human, dealer).play
      continue_match
      break if [human.match_score, dealer.match_score].include?(match_length)
    end
  end
end

Match.new(Shoe.new).play

