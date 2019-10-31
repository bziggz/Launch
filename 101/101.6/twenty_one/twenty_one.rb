DECK = {
  "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8,
  "9" => 9, "10" => 10, "J" => 10, "Q" => 10, "K" => 10, "A" => 11
}

def prompt(str)
  puts "=> #{str}"
end

def clear_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
end

def welcome
  prompt "***  Welcome to Twenty-One!  ***"
  puts "\n"
end

def initialize_game_deck
  DECK.keys * 4
end

def deal_card(deck, hand)
  deck_indices = (0...deck.size).to_a
  card_index = deck_indices.sample
  hand << deck.slice!(card_index)
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
    value == 11 && value_list.sum > 21 ? 1 : value
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
    break if dealer_total >= 17
    deal_card(deck, dealer_hand)
  end

  dealer_hand
end

def display_totals(player_total, dealer_total)
  "Your Total: #{player_total} ||| The Dealer's Total: #{dealer_total}"
end

def display_outcome(player_total, dealer_total)
  if player_total > 21
    "You Bust!!!"
  elsif dealer_total > 21
    "The Dealer Busts! You win!!!"
  elsif player_total > dealer_total
    "You win!!!"
  elsif player_total < dealer_total
    "The Dealer wins."
  else
    "It's a Push."
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
  game_deck = initialize_game_deck
  dealer_hand = []
  player_hand = []
  player_total = 0

  2.times do
    deal_card(game_deck, player_hand)
    deal_card(game_deck, dealer_hand)
  end

  loop do # PLAYER'S TURN
    display_table(player_hand, dealer_hand)

    player_total = total_cards(player_hand)

    break if player_total >= 21 || hit_or_stay(player_hand, dealer_hand) == 2

    deal_card(game_deck, player_hand)

    clear_screen
  end

  dealer_turn(game_deck, dealer_hand) unless player_total > 21

  dealer_total = total_cards(dealer_hand)

  display_table(player_hand, dealer_hand, "No")

  prompt display_totals(player_total, dealer_total)
  prompt display_outcome(player_total, dealer_total)

  break unless play_again?

  clear_screen
end

prompt "Thanks for playing! Go Bucks!!!"
