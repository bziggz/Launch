module Clearable
  def clear_screen
    Gem.win_platform? ? (system "cls") : (system "clear")
  end

  def clear_input(n, str)
    "\e[#{n}A" + str + "\e[K"
  end
end

class Card
  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = Deck::RANKS[rank]
  end
end

class Deck
  SUITS = [
    "\xE2\x99\xA0", # spades
    "\xE2\x99\xA3", # clubs
    "\xE2\x99\xA5", # hearts
    "\xE2\x99\xA6"  # diamonds
  ].freeze

  RANKS = {
    "2 " => 2, "3 " => 3, "4 " => 4, "5 " => 5, "6 " => 6, "7 " => 7,
    "8 " => 8, "9 " => 9, "10" => 10, "J " => 10, "Q " => 10, "K " => 10,
    "A " => 11
  }.freeze

  attr_reader :cards

  def initialize
    @cards = RANKS.keys.product(SUITS)
  end

  def *(num)
    @cards * num
  end
end

class Shoe
  NUMBER_OF_DECKS = 8

  def initialize
    reset
  end

  def draw
    reset if @cards.empty?
    card = @cards.sample
    @cards.delete(card)
    Card.new(card[0], card[1])
  end

  private

  def reset
    @cards = Deck.new * NUMBER_OF_DECKS
  end
end

class Hand
  include Comparable
  attr_accessor :cards, :score, :size

  def initialize
    @cards = []
    @size = 0
  end

  def <<(card)
    cards << card
    format_for_display
    @size = cards.size
    @score = determine_score
  end

  def determine_score
    values = cards.map(&:value)

    values.map! do |value|
      value == 11 && values.sum > Match::TARGET ? 1 : value
    end

    values.sum
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/AbcSize
  def show_cards(face_up = true)
    if face_up == false && size >= 2
      ranks[-1] = '   '
      suits[-1] = ' ? '
    end

    puts "\n"
    puts "  ___ " * size
    print " |#{ranks.shift}|" until ranks.nil? || ranks.empty?
    puts ""
    print " |#{suits.shift}|" until suits.nil? || suits.empty?
    puts ""
    puts " |___|" * size
    puts "\n"

    format_for_display
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/AbcSize

  protected

  def <=>(other)
    score <=> other.score
  end

  private

  attr_accessor :ranks, :suits

  def format_for_display
    @ranks = cards.map { |card| card.rank.to_s.ljust(3) }
    @suits = cards.map { |card| card.suit.to_s.rjust(3) }
  end
end

class Player
  include Clearable
  attr_accessor :hand, :match_score, :name

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
    busted? || blackjack? || stay?
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp.strip
      break unless n.empty?
      puts clear_input(2, "Must enter something.\n")
    end

    self.name = n
  end

  def stay?
    answer = nil
    loop do
      puts %(Do you want to Hit or Stay?
      1 - Hit
      2 - Stay)
      answer = gets.chomp.to_i
      break if [1, 2].include?(answer)
      print clear_input(4, "Invalid Choice. ")
    end
    answer == 2
  end
end

class Dealer < Player
  def stay?
    sleep(0.8)
    hand.score >= 17
  end

  def set_name
    self.name = %w(Abed Troy Jeff Britta Annie Shirley Pierce).sample
  end
end

class Game
  include Clearable
  attr_reader :shoe, :human, :dealer, :outcome

  def initialize(shoe, human, dealer)
    @shoe = shoe
    @human = human
    @dealer = dealer
    display_table(face_up: false, show_score: false)
    deal_opening_hand
  end

  def play
    turn(human)
    turn(dealer) unless human.blackjack? || human.busted?
    @outcome = determine_game_outcome
    display_table
    display_game_outcome
    keep_score
    reset_table
  end

  private

  def deal_opening_hand
    2.times do
      sleep(0.75)
      deal(human)
      display_table(face_up: false, show_score: false)
      sleep(0.75)
      deal(dealer)
      display_table(face_up: false, show_score: false)
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
      player == human ? display_table(face_up: false, show_score: false) :
                        display_table
      break if player.take_hit?
      deal(player)
    end
  end

  def compare_cards
    if human.hand > dealer.hand
      :human_win
    elsif human.hand < dealer.hand
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
    possible_outcomes = {
      human_blackjack: "Blackjack!!! You win!!!",
      human_bust: "You Bust!!!",
      dealer_blackjack: "#{dealer.name} has Blackjack. #{dealer.name} Wins.",
      dealer_bust: "#{dealer.name} Busts! You win!!!",
      human_win: "You win!!!",
      dealer_win: "#{dealer.name} wins.",
      push: "Push."
    }

    puts possible_outcomes[outcome]
  end

  def determine_game_winner
    case outcome
    when :human_blackjack, :dealer_bust, :human_win   then human
    when :human_bust, :dealer_blackjack, :dealer_win  then dealer
    end
  end

  def keep_score
    determine_game_winner.update_match_score
  end

  def display_score
    puts "#{human.player_score} ||| #{dealer.player_score}"
  end

  def display_table(face_up: true, show_score: true)
    dealer_hand = dealer.hand
    human_hand = human.hand
    show_score ? dealer_total = dealer_hand.score : dealer_total = '??'

    clear_screen
    display_score
    dealer_hand.show_cards(face_up)
    puts "#{dealer.name}'s Total: #{dealer_total}"
    puts "-------------------------------"
    puts "#{human.name}'s Total: #{human_hand.score}"
    human_hand.show_cards
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

  def initialize
    clear_screen
    display_welcome_message
    @shoe = Shoe.new
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

  attr_reader :human, :dealer, :shoe

  def display_welcome_message
    puts "Welcome to 21!!!"
    puts "\n"
  end

  def set_match_length
    answer = nil

    loop do
      puts "\nHow many games needed to win the match?"
      answer = gets.chomp.strip

      break if answer =~ /^[0-9]+$/ && answer.to_i > 0

      if answer =~ /^[0-9]+$/ && answer.to_i == 0
        puts clear_input(2, "You have to play at least one game.")
      else
        puts clear_input(2, "Invalid Entry.")
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
      print clear_input(2, "Invalid Entry. ")
    end

    answer.downcase == 'y'
  end

  def display_goodbye_message
    clear_screen
    puts "Thanks for playing 21! Go Bucks!!!"
    puts "\n"
    sleep(0.75)
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

Match.new.play
