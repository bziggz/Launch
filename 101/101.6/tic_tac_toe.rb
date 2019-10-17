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

def retrieve_match_length
  answer = nil

  loop do
    prompt "How many games needed to win the match?"
    answer = gets.chomp.strip
    break if answer =~ /^[0-9]+$/
    prompt "Invalid choice."
  end

  answer.to_i
end

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
def display_board(hsh1, hsh2)
  clear_screen
  puts "---Current Game Score---"
  puts "You: #{hsh2['You']} ||| The Computer: #{hsh2['The Computer']}"
  puts ""
  puts "You are X. Computer is O."
  puts ""
  puts "     |     |"
  puts "  #{hsh1[1]}  |  #{hsh1[2]}  |  #{hsh1[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{hsh1[4]}  |  #{hsh1[5]}  |  #{hsh1[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{hsh1[7]}  |  #{hsh1[8]}  |  #{hsh1[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength

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
    prompt %(Who do you want to go first?
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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
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

def alternate_player(plyr)
  plyr == "You" ? "The Computer" : "You"
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

def win_the_game(brd)
  square = nil
  WINNING_LINES.each do |line|
    if  brd.values_at(*line).count(COMP_MARKER) == 2 &&
        brd.values_at(*line).count(INITIAL_MARKER) == 1
      square = best_move(line, brd)
    end
  end

  square
end

def avoid_losing(brd)
  square = nil
  WINNING_LINES.each do |line|
    if  brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
        brd.values_at(*line).count(INITIAL_MARKER) == 1
      square = best_move(line, brd)
    end
  end

  square
end

def best_move(line, brd)
  line.select { |num| brd[num] == INITIAL_MARKER }[0]
end

def find_best_square(brd)
  if !!win_the_game(brd)
    win_the_game(brd)
  elsif !!avoid_losing(brd)
    avoid_losing(brd)
  elsif empty_squares(brd).include?(CENTER_SQUARE)
    CENTER_SQUARE
  end
end

def computer_turn!(brd)
  square = if !!find_best_square(brd)
             find_best_square(brd)
           else
             empty_squares(brd).sample
           end

  brd[square] = COMP_MARKER
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

def pause_between_game
  prompt "Press ENTER/RETURN to continue..."
  answer = gets
  answer
end

def keep_score(hsh, brd)
  hsh[detect_winner(brd)] += 1 if someone_won?(brd)
end

def detect_match_winner(hsh, num)
  if hsh["You"] == num
    "You win the match #{hsh['You']} - #{hsh['The Computer']} !!"
  elsif hsh["The Computer"] == num
    "The Computer wins the match #{hsh['The Computer']} - #{hsh['You']} !!"
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

loop do # MATCH LOOP
  games = retrieve_match_length
  scoreboard = { "You" => 0, "The Computer" => 0 }

  if FIRST_PLAYER == "choose"
    game_lead = retrieve_first_player
    current_player = starting_player(game_lead)
  else
    current_player = FIRST_PLAYER
  end

  loop do # GAME LOOP
    board = initialize_board

    loop do
      display_board(board, scoreboard)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, scoreboard)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie"
    end

    keep_score(scoreboard, board)
    break if scoreboard.value?(games)

    pause_between_game

    current_player = if FIRST_PLAYER == "choose"
                       first_player(game_lead, board)
                     else
                       FIRST_PLAYER
                     end
  end

  prompt detect_match_winner(scoreboard, games)

  break unless play_again?
end

prompt "Thanks for playing! Go Bucks!!!"
