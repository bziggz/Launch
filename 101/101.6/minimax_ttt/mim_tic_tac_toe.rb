INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMP_MARKER = "O"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
CENTER_SQUARE = 5
FIRST_PLAYER = "choose"

def prompt(str)
  puts "=> #{str}"
end

def clear_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
end

def welcome
  prompt "*** Welcome to the Unbeatable Tic-Tac-Toe! ***"
  prompt "The scoreboard is only there to make you think you have a chance..."
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

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
def display_board(game_board, scoreboard)
  clear_screen
  puts "---Current Game Score---"
  puts "You: #{scoreboard['You']} ||| "\
    "The Computer: #{scoreboard['The Computer']}"
  puts ""
  puts "You are X. The Computer is O."
  puts ""
  puts "     |     |"
  puts "  #{game_board[1]}  |  #{game_board[2]}  |  #{game_board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{game_board[4]}  |  #{game_board[5]}  |  #{game_board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{game_board[7]}  |  #{game_board[8]}  |  #{game_board[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }

  new_board
end

def joinor(arr, notlast = ', ', last = "or")
  if arr.size < 2
    arr[0].to_s
  elsif arr.size < 3
    "#{arr[0]} #{last} #{arr[1]}"
  else
    "#{arr[0..-2].join(notlast.to_s)}#{notlast}#{last} #{arr[-1]}"
  end
end

def retrieve_first_player
  answer = ''
  loop do
    prompt %(Who should want to go first?
      1 - Always You
      2 - Always The Computer
      3 - The Winner of the Last Game
      4 - The Loser of the Last Game)
    answer = gets.chomp.strip
    break if %w(1 2 3 4).include?(answer)
    prompt "Invalid Response."
  end

  answer
end

def first_player(answer, brd)
  case answer
  when "1" then "You"
  when "2" then "The Computer"
  when "3" then detect_winner(brd)
  when "4" then alternate_player(detect_winner(brd))
  end
end

def starting_player(answer)
  if answer == "2"
    "The Computer"
  else
    "You"
  end
end

def determine_player
  if FIRST_PLAYER == "choose"
    game_lead = retrieve_first_player
    current_player = starting_player(game_lead)
  else
    current_player = FIRST_PLAYER
  end

  return game_lead, current_player
end

def next_game_first_player(game_lead, brd)
  FIRST_PLAYER == "choose" ? first_player(game_lead, brd) : FIRST_PLAYER
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def place_piece!(brd, plyr)
  if plyr == "You"
    player_turn!(brd)
  else
    computer_turn!(brd)
  end
end

def player_turn!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Invalid choice."
  end

  brd[square] = PLAYER_MARKER
end

def score_the_game(brd)
  outcome = detect_winner(brd)

  if outcome == "The Computer"
    10
  elsif outcome == "You"
    -10
  elsif board_full?(brd)
    0
  end
end

def score_selector(player, scores)
  player == "The Computer" ? scores.min : scores.max
end

def generate_move_scorecard(brd)
  possible_move_hash = {}
  empty_squares(brd).each { |move| possible_move_hash[move] = nil }
  possible_move_hash
end

def temp_piece(player)
  player == "You" ? PLAYER_MARKER : COMP_MARKER
end

def alternate_player(player)
  player == "You" ? "The Computer" : "You"
end

def minimax(brd, move, player)
  temp_board = brd.dup
  scores = []

  temp_board[move] = temp_piece(player)

  score = score_the_game(temp_board)

  if !!score
    scores << score
  else
    available_moves = empty_squares(temp_board)

    available_moves.each do |next_move|
      scores << minimax(temp_board, next_move, alternate_player(player))
    end

  end

  score_selector(player, scores)
end

def find_minimax_square(brd)
  move_scores = generate_move_scorecard(brd)
  available_moves = move_scores.keys

  available_moves.each do |move|
    move_scores[move] = minimax(brd, move, "The Computer")
  end

  move_scores.key(move_scores.values.max)
end

def computer_turn!(brd)
  square = find_best_square(brd) || find_minimax_square(brd)

  brd[square] = COMP_MARKER
end

def win_or_block(brd, marker)
  square = nil
  WINNING_LINES.each do |line|
    if  brd.values_at(*line).count(marker) == 2 &&
        brd.values_at(*line).count(INITIAL_MARKER) == 1
      square = make_apprpriate_move(line, brd)
    end
  end

  square
end

def make_apprpriate_move(line, brd)
  line.select { |num| brd[num] == INITIAL_MARKER }[0]
end

def piece_in_center_square(brd)
  CENTER_SQUARE if empty_squares(brd).include?(CENTER_SQUARE)
end

def find_best_square(brd)
  win_or_block(brd, COMP_MARKER) ||
    win_or_block(brd, PLAYER_MARKER) ||
    piece_in_center_square(brd)
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "You"
    elsif brd.values_at(*line).count(COMP_MARKER) == 3
      return "The Computer"
    end
  end
  nil
end

def display_game_outcome(brd)
  if someone_won?(brd)
    prompt "#{detect_winner(brd)} won!"
  else
    prompt "It's a tie"
  end
end

def pause_between_game
  prompt "Press ENTER/RETURN to continue..."
  answer = gets
  answer
end

def keep_score(scoreboard, brd)
  scoreboard[detect_winner(brd)] += 1 if someone_won?(brd)
end

def display_match_outcome(scoreboard, player)
  case player
  when "You"
    "You win the match #{scoreboard['You']} - #{scoreboard['The Computer']}!!"
  when "The Computer"
    "The Computer wins the match #{scoreboard['The Computer']} "\
    "- #{scoreboard['You']}!!"
  else
    "Match tied #{scoreboard['You']} - #{scoreboard['The Computer']}."
  end
end

def detect_match_winner(scoreboard)
  if scoreboard["You"] > scoreboard["The Computer"]
    "You"
  elsif scoreboard["You"] < scoreboard["The Computer"]
    "The Computer"
  end
end

def play_again?
  answer = ''
  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase.strip
    break if %w(yes yeah yup sure yah y no nope nah n).include?(answer)
    prompt "Invalid Entry"
  end

  return true if %w(yes yeah yup sure yah y).include?(answer)
end

def play_round(board, scoreboard, current_player)
  loop do
    display_board(board, scoreboard)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end
end

# -------- PROGRAM START --------

clear_screen
welcome

loop do # MATCH LOOP
  games = retrieve_match_length
  game_count = 0
  scoreboard = { "You" => 0, "The Computer" => 0 }

  game_lead, current_player = determine_player

  loop do # GAME LOOP
    board = initialize_board

    play_round(board, scoreboard, current_player)

    display_board(board, scoreboard)

    display_game_outcome(board)

    keep_score(scoreboard, board)
    game_count += 1
    break if game_count == games

    pause_between_game

    current_player = next_game_first_player(game_lead, board)
  end

  winner = detect_match_winner(scoreboard)

  prompt display_match_outcome(scoreboard, winner)

  break unless play_again?

  clear_screen
end

prompt "Thanks for playing! Go Bucks!!!"
