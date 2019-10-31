DECK = {
  "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8,
  "9" => 9, "10" => 10, "J" => 10, "Q" => 10, "K" => 10, "A" => 11
}

TARGET_NUMBER = 21
DEALER_STAY = TARGET_NUMBER - 4
BEST_SCORE =  if TARGET_NUMBER <= 11
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
    break if answer =~ /^[0-9]+$/ || answer == 0

    if answer == 0
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
  DECK.keys * 4
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

def display_hand(hand, hidden = "No")
  output = ""

  if hidden == "Yes"
    output << hand[0] + " ?"
  else
    hand.each { |card| output << card + " " }
  end

  output
end

def display_table(player_hand, dealer_hand, hidden = "Yes")
  prompt "The Dealer's Cards: #{display_hand(dealer_hand, hidden)}"
  prompt "Your Cards: #{display_hand(player_hand)}"
  puts "\n"
end

def total_cards(hand)
  value_list = hand.map { |card| DECK[card] }

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

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
def display_outcome(player_total, player_hand, dealer_total)
  if player_total > TARGET_NUMBER
    "You Bust!!!"
  elsif dealer_total > TARGET_NUMBER
    "The Dealer Busts! You win!!!"
  elsif (player_total == TARGET_NUMBER && player_hand.size == BEST_SCORE) ||
        player_total > dealer_total
    "You win!!!"
  elsif player_total < dealer_total
    "The Dealer wins."
  else
    "It's a Push."
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity

def who_won_the_game(outcome)
  case outcome
  when "You win!!!", "The Dealer Busts! You win!!!"
    "You"
  when "You Bust!!!", "The Dealer wins."
    "The Dealer"
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
  answer = ''
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
    player_total = 0

    deal_opening_hand(game_deck, player_hand, dealer_hand)

    loop do # PLAYER'S TURN
      display_table(player_hand, dealer_hand)

      player_total = total_cards(player_hand)

      break if  player_total >= TARGET_NUMBER ||
                hit_or_stay(player_hand, dealer_hand) == 2

      deal_card(game_deck, player_hand)

      game_clear(scoreboard)
    end

    dealer_turn(game_deck, dealer_hand) unless player_total > TARGET_NUMBER

    dealer_total = total_cards(dealer_hand)

    display_table(player_hand, dealer_hand, "No")

    prompt display_totals(player_total, dealer_total)
    prompt outcome = display_outcome(player_total, player_hand, dealer_total)

    keep_score(scoreboard, who_won_the_game(outcome))

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
