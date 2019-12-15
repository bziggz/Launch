class Banner
  def initialize(message, width = message.size)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{"-" * @width}-+"
  end

  def empty_line
    "| #{" " * @width} |"
  end

  def message_line
    "| #{@message[0, @width].center(@width)} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('', 16)
puts banner