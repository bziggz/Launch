SUITS = ["\xE2\x99\xA0", "\xE2\x99\xA3", "\xE2\x99\xA5", "\xE2\x99\xA6"]
DECK = {
  "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8,
  "9" => 9, "10" => 10, "J" => 10, "Q" => 10, "K" => 10, "A" => 11
}

TARGET_NUMBER = 21
DEALER_STAY = TARGET_NUMBER - 4
BLACKJACK = if TARGET_NUMBER <= 11
              1
            elsif TARGET_NUMBER <= 44
              TARGET_NUMBER / 11 + 1
            elsif TARGET_NUMBER <= 204
              (TARGET_NUMBER - 35) / 10
            end

def prompt(str)
  puts "=> #{str}"
end

def clear_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
end

def game_clear(scoreboard)
  clear_screen
  prompt display_scoreboard(scoreboard)
  puts "\n"
end

def welcome
  prompt "***  Welcome to #{TARGET_NUMBER}!  ***"
  puts "\n"
end

def retrieve_match_length
  answer = nil

  loop do
    prompt "How many games do you want to play?"
    answer = gets.chomp.strip
    break if answer =~ /^[0-9]+$/ && answer != "0"

    if answer == "0"
      prompt "You have to play at least one game!"
    else
      prompt "Invalid choice."
    end
  end

  answer.to_i
end

def display_scoreboard(board)
  "Current Score: You #{board['You']} ||| The Dealer #{board['The Dealer']}"
end

def initialize_game_deck
  DECK.keys.product(SUITS)
end

def deal_card(deck, hand)
  deck_indices = (0...deck.size).to_a
  card_index = deck_indices.sample
  hand << deck.slice!(card_index)
end

def deal_opening_hand(deck, player_hand, dealer_hand)
  2.times do
    deal_card(deck, player_hand)
    deal_card(deck, dealer_hand)
  end
end

def display_card(card)
  "[#{card[0]}#{card[1]}]"
end

def display_hand(hand, hidden = false)
  output = ""

  if hidden
    output << display_card(hand[0]) + " [XX]"
  else
    hand.each { |card| output << display_card(card) + " " }
  end

  output
end

def display_table(player_hand, dealer_hand, hidden = true)
  prompt "The Dealer's Cards: #{display_hand(dealer_hand, hidden)}"
  prompt "Your Cards: #{display_hand(player_hand, false)}"
  puts "\n"
end

def player_turn(player_hand, dealer_hand, deck, scoreboard)
  player_total = 0

  loop do
    display_table(player_hand, dealer_hand)
    player_total = total_cards(player_hand)

    break if  blackjack?(player_total, player_hand) ||
              busted?(player_total) ||
              player_stays?(player_hand, dealer_hand)

    deal_card(deck, player_hand)
    game_clear(scoreboard)
  end

  player_total
end

def total_cards(hand)
  value_list = hand.map { |card| DECK[card[0]] }

  value_list.map! do |value|
    value == 11 && value_list.sum > TARGET_NUMBER ? 1 : value
  end

  value_list.sum
end

def hit_or_stay(player_hand, dealer_hand)
  answer = nil

  loop do
    prompt %(Do you want to Hit or Stay?
      1 - Hit
      2 - Stay)
    answer = gets.chomp.to_i
    break if [1, 2].include?(answer)
    clear_screen
    display_table(player_hand, dealer_hand)
    prompt "Invalid Choice"
  end

  answer
end

def player_stays?(player_hand, dealer_hand)
  hit_or_stay(player_hand, dealer_hand) == 2
end

def blackjack?(player_total, player_hand)
  player_total == TARGET_NUMBER && player_hand.size == BLACKJACK
end

def busted?(total)
  total > TARGET_NUMBER
end

def dealer_turn(deck, dealer_hand)
  loop do
    dealer_total = total_cards(dealer_hand)
    break if dealer_total >= DEALER_STAY
    deal_card(deck, dealer_hand)
  end

  dealer_hand
end

def display_totals(player_total, dealer_total)
  "Your Total: #{player_total} ||| The Dealer's Total: #{dealer_total}"
end

def compare_cards(player_total, dealer_total)
  if player_total > dealer_total
    :player_win
  elsif player_total < dealer_total
    :dealer_win
  else
    :push
  end
end

def game_outcome(player_total, player_hand, dealer_total, dealer_hand)
  if blackjack?(player_total, player_hand)
    :player_blackjack
  elsif busted?(player_total)
    :player_bust
  elsif blackjack?(dealer_total, dealer_hand)
    :dealer_blackjack
  elsif busted?(dealer_total)
    :dealer_bust
  else
    compare_cards(player_total, dealer_total)
  end
end

def display_outcome(outcome)
  case outcome
  when :player_blackjack then "Blackjack!!!"
  when :player_bust then "You Bust!!!"
  when :dealer_blackjack then "The Dealer has Blackjack. The Dealer Wins."
  when :dealer_bust then "The Dealer Busts! You win!!!"
  when :player_win then "You win!!!"
  when :dealer_win then "The Dealer wins."
  when :push then "Push."
  end
end

def determine_game_winner(outcome)
  case outcome
  when :player_blackjack, :dealer_bust, :player_win then "You"
  when :player_bust, :dealer_blackjack, :dealer_win then "The Dealer"
  end
end

def keep_score(scoreboard, winner)
  scoreboard[winner] += 1 unless winner.nil?
end

def pause_between_game
  prompt "Press ENTER/RETURN to continue..."
  answer = gets
  answer
end

def detect_match_winner(scoreboard)
  if scoreboard["You"] > scoreboard["The Dealer"]
    "You"
  elsif scoreboard["You"] < scoreboard["The Dealer"]
    "The Dealer"
  end
end

def display_match_outcome(score, winner)
  case winner
  when "You"
    "You win the match #{score['You']} - #{score['The Dealer']}!!"
  when "The Dealer"
    "The Dealer wins the match #{score['The Dealer']} - #{score['You']}."
  else
    "Match Tied #{score['You']} - #{score['The Dealer']}."
  end
end

def play_again?
  answer = 1
  loop do
    prompt %(Play again?
    1 - Yes
    2 - No)
    answer = gets.chomp.to_i
    break if [1, 2].include?(answer)
    prompt "Invalid Entry"
  end

  return true if answer == 1
end

# -------- PROGRAM START ---------

clear_screen
welcome

loop do # MAIN LOOP
  games = retrieve_match_length
  game_count = 0
  scoreboard = { "You" => 0, "The Dealer" => 0 }

  loop do # MATCH LOOP
    game_clear(scoreboard)

    game_deck = initialize_game_deck
    dealer_hand = []
    player_hand = []

    deal_opening_hand(game_deck, player_hand, dealer_hand)

    player_total = player_turn(player_hand, dealer_hand, game_deck, scoreboard)

    dealer_turn(game_deck, dealer_hand) unless player_total > TARGET_NUMBER

    dealer_total = total_cards(dealer_hand)

    display_table(player_hand, dealer_hand, false)

    prompt display_totals(player_total, dealer_total)
    result = game_outcome(player_total, player_hand, dealer_total, dealer_hand)
    prompt display_outcome(result)

    keep_score(scoreboard, determine_game_winner(result))

    game_count += 1

    break if game_count == games

    pause_between_game
  end

  winner = detect_match_winner(scoreboard)

  prompt display_match_outcome(scoreboard, winner)

  break unless play_again?

  clear_screen
end

prompt "Thanks for playing! Go Bucks!!!"
