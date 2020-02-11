class TextAnalyzer
  def process
    text = File.open("text_analyzer_text.txt")
    puts yield(text.read)
    text.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| "#{text.split("\n\n").size} paragraphs"}
analyzer.process { |text| "#{text.split("\n").size} lines" }
analyzer.process { |text| "#{text.split(" ").size} words" }


# 3 paragraphs
# 15 lines
# 126 words