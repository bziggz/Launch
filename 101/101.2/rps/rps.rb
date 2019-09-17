VALID_CHOICES = {
  "r" => "rock",
  "p" => "paper",
  "sc" => "scissors",
  "l" => "lizard",
  "sp" => "spock"
}

OUTCOMES = {
  "rock" => { "lizard" => "crushes", "scissors" => "crushes" },
  "paper" => { "rock" => "covers", "spock" => "disproves" },
  "scissors" => { "paper" => "cuts", "lizard" => "decapitates" },
  "lizard" => { "spock" => "poisons", "paper" => "eats" },
  "spock" => { "rock" => "vaporizes", "scissors" => "smashes" }
}

def prompt(message)
  puts("=> #{message}")
end

def retrieve_game_length
  loop do
    prompt("How many rounds do you want to play?")
    choice = gets.chomp.strip

    if choice =~ /^\d*$/ && choice.to_i > 0
      return choice.to_i
    else
      prompt("That's not a valid choice. Please enter a whole number.")
    end
  end
end

def retrieve_choice
  loop do
    prompt("Choose one: rock (r), paper (p), "\
      "scissors (sc), lizard (l), or Spock (sp).")

    choice = gets.chomp.downcase

    if VALID_CHOICES.key?(choice)
      return VALID_CHOICES[choice]
    elsif OUTCOMES.key?(choice)
      return choice
    else
      prompt("That's not a valid choice.")
    end
  end
end

def win_game?(first, second)
  OUTCOMES[first].include?(second)
end

def determine_game_winner(player, computer)
  if win_game?(player, computer)
    :player
  elsif win_game?(computer, player)
    :computer
  end
end

def display_choices(user_choice, comp_choice)
  puts "You chose #{user_choice.capitalize}. "\
        "The Computer chose #{comp_choice.capitalize}."
end

def display_battle(winner, loser)
  if winner == "rock" && loser == "scissors"
    "As it always has, "\
    "#{winner.capitalize} #{OUTCOMES[winner][loser]} #{loser.capitalize}."
  else
    "#{winner.capitalize} #{OUTCOMES[winner][loser]} #{loser.capitalize}."
  end
end

def display_results(player, computer)
  if win_game?(player, computer)
    prompt("#{display_battle(player, computer)} You win!")
  elsif win_game?(computer, player)
    prompt("#{display_battle(computer, player)} You lose!")
  else
    prompt("It's a tie!")
  end
end

def update_score(hsh, game_winner)
  if hsh.include?(game_winner)
    hsh[game_winner] += 1
  end
end

def display_game_score(hsh)
  prompt("Score: #{hsh.values.join('-')}")
end

def win_match?(hsh, winning_score)
  hsh.value?(winning_score)
end

def determine_match_winner(hsh, winning_score)
  hsh.key(winning_score)
end

def display_match_winner(winner, hsh)
  if winner == :player
    prompt("You win #{hsh.values.join('-')}!")
  else
    prompt("You lose #{hsh.values.join('-')}.")
  end
end

def rematch?
  loop do
    prompt("Rematch?")
    answer = gets.chomp.strip.downcase

    if %w(y yes yeah sure yea yup).include?(answer)
      return true
    elsif %w(n no nah nope).include?(answer)
      return false
    else
      prompt("Invalid Response. You want some more or not?!")
    end
  end
end

def clear_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
end

# MAIN LOOP

loop do
  scorecard = { player: 0, computer: 0 }
  winning_score = retrieve_game_length()

  loop do
    choice = retrieve_choice()

    computer_choice = VALID_CHOICES.values.sample

    display_choices(choice, computer_choice)

    display_results(choice, computer_choice)

    update_score(scorecard, determine_game_winner(choice, computer_choice))

    break if win_match?(scorecard, winning_score)

    display_game_score(scorecard)
  end

  winner = determine_match_winner(scorecard, winning_score)

  display_match_winner(winner, scorecard)

  break unless rematch?
  clear_screen()
end

prompt("Thanks for playing! Go Buckeyes!")

