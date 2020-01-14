module Clearable
  def clear_screen
    Gem.win_platform? ? (system "cls") : (system "clear")
  end
end

class Player
  attr_accessor :move, :name, :score, :marker

  def initialize
    set_name
    @score = 0
  end

  def update_score
    self.score += 1
  end

  def player_score
    "#{name}: #{score}"
  end
end

class Human < Player
  def initialize
    super
    retrieve_marker
  end

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

  def retrieve_marker
    n = ''
    loop do
      puts "Which marker do you want to use, X or O?"
      n = gets.chomp.strip.upcase
      break if %w(X O).include?(n)
      puts "Invalid Entry."
    end

    self.marker = n
  end
end

class Computer < Player
  attr_reader :board, :squares, :marker

  def initialize(other_marker)
    super()
    determine_marker(other_marker)
  end

  def set_name
    self.name = ["Frank", "Charlie", "Dee", "Dennis", "Mac"].sample
  end

  def determine_marker(other_marker)
    self.marker = other_marker == 'X' ? 'O' : 'X'
  end
end

class Board
  CENTER_SQUARE = 5
  WINNING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
  ]

  attr_reader :best_square, :human, :computer

  def initialize(human, computer)
    @squares = {}
    reset
    @human = human
    @computer = computer
  end

  # rubocop: disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |"\
    "  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |"\
    "  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |"\
    "  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop: enable Metrics/AbcSize

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!detect_winning_marker
  end

  def set_best_square
    @best_square =  win_or_block(computer.marker) ||
                    win_or_block(human.marker) ||
                    piece_in_center_square
  end

  def detect_winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end

    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def two_identical_markers?(squares, marker)
    squares.select { |square| square.marker == marker }.size == 2
  end

  def one_unmarked?(squares)
    squares.select(&:unmarked?).size == 1
  end

  def win_or_block(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if two_identical_markers?(squares, marker) && one_unmarked?(squares)
        return @squares.key(make_appropriate_move(squares))
      end
    end

    nil
  end

  def make_appropriate_move(squares)
    squares.select(&:unmarked?)[0]
  end

  def piece_in_center_square
    CENTER_SQUARE if @squares[CENTER_SQUARE].unmarked?
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Game
  include Clearable

  FIRST_TO_MOVE = human.marker

  def play
    display_board

    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end

    self.game_winner = board.detect_winning_marker
    display_result
    keep_score
  end

  private

  attr_reader :board, :human, :computer, :marker
  attr_accessor :game_winner

  def initialize(human, computer, first_player)
    @board = Board.new(human, computer)
    @current_marker = FIRST_TO_MOVE || first_player
    @human = human
    @computer = computer
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def determine_loser(winner)
    winner == human.marker ? computer.marker : human.marker
  end

  def display_board
    display_score
    puts ""
    puts "You are #{human.marker}. The Computer is #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def display_score
    puts "#{human.player_score} ||| #{computer.player_score}"
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_turn?
    @current_marker == human.marker
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

  def human_moves
    available_moves = board.unmarked_keys
    puts "Choose a square (#{joinor(available_moves)})"
    square = nil

    loop do
      square = gets.chomp.to_i
      break if available_moves.include?(square)
      puts "Invalid Choice. Please enter (#{joinor(available_moves)})"
    end

    board[square] = human.marker
  end

  def computer_moves
    if !!board.set_best_square
      board[board.best_square] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def keep_score
    case game_winner
    when human.marker then human.update_score
    when computer.marker then computer.update_score
    end
  end

  def display_result
    clear_screen_and_display_board

    case game_winner
    when human.marker then puts "You Won!"
    when computer.marker then puts "The Computer Won."
    else puts "It's a tie."
    end
  end

  def reset_for_new_game
    board.reset
    clear_screen
    @current_marker = FIRST_TO_MOVE || first_player
    puts "Let's play again!"
    puts ""
  end
end

class TTTMatch
  include Clearable

  def initialize
    clear_screen
    display_welcome_message
    @human = Human.new
    @computer = Computer.new(human.marker)
  end

  def play
    loop do
      game_sequence(set_match_length, set_first_player)
      display_match_winner
      break unless play_again?
      reset_match_score
      clear_screen
    end

    display_goodbye_message
  end

  private

  attr_accessor :human, :computer, :winner, :score, :first_player

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!!!"
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

  def set_first_player
    @first_player = retrieve_first_player
  end

  def retrieve_first_player
    answer = ''

    loop do
      puts %(Who do you want to go first?
        1 -You
        2 -The Computer)
      answer = gets.chomp.strip
      break if %w(1 2).include?(answer)
      puts "Invalid Response."
    end

    answer == '1' ? human.marker : computer.marker
  end

  def display_match_winner
    human_score = human.score
    computer_score = computer.score

    if human_score > computer_score
      puts "#{human.name} wins #{human_score}-#{computer_score} !!!"
    else
      puts "#{computer.name} wins #{computer_score}-#{human_score} !!!"
    end
  end

  def continue_match
    puts "Press Enter to continue."
    gets
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

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Go Bucks!!!"
  end

  def game_sequence(length, first_player)
    loop do
      clear_screen
      Game.new(human, computer, first_player).play
      continue_match
      break if [human.score, computer.score].include?(length)
    end
  end
end

TTTMatch.new.play
