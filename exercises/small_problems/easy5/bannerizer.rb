LINE_LENGTH = 76

def line_splitter(str)
  word_array = str.split(" ")
  line_array = []

  until word_array.empty?
    line = ""

    while line.size < LINE_LENGTH
      line << word_array.shift.to_s + " "
    end

    if line.size > LINE_LENGTH
      word_array.unshift(line.split(" ").pop)
      line = line.split(" ")[0..-2].join(" ")
    end

    line_array << line.strip.center(LINE_LENGTH)
  end

  line_array
end

def print_in_box(str)
  string_array = str.size > LINE_LENGTH ? line_splitter(str) : [str]

  box_length = string_array.map { |str| str.size }.max

  border = "+-" + "-" * box_length + "-+"
  side = "| " + " " * box_length + " |"

  puts border
  puts side
  string_array.each { |str| puts "| " + str + " |"}
  puts side
  puts border
end

print_in_box('To boldly go where no one has gone before.')

print_in_box('')

print_in_box("The man in black fled across the desert, "\
  "and the gunslinger followed. "\
  "The desert was the apotheosis of all deserts, "\
  "huge, standing to the sky for what looked like "\
  "eternity in all directions. It was white and blinding "\
  "and waterless and without feature save for the faint, "\
  "cloudy haze of the mountains which sketched themselves "\
  "on the horizon and the devil-grass which brought sweet dreams, "\
  "nightmares, death. An occasional tombstone sign pointed the way, "\
  "for once the drifted track that cut its way through the thick "\
  "crust of alkali had been a highway. Coaches and buckas had followed it. "\
  "The world had moved on since then. The world had emptied.")


