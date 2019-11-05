=begin SOURCE:
EXTRACT PROBLEM 
INPUT
  a text file

EXAMPLE
OUTPUT 
  PRINT longest sentence in file based on word count (".", "!", "?")
  PRINT number of words in that sentence
EXPERIMENT / EDGE
  Word is any non-space, non-delimited char
  Two longest sentences equal length?
ALGO 
  GIVEN a text file
  LOAD file 
  SEPARATE file into array of sentences (".", "!", "?")
  SEPARATE each sentence into word array (" ")
  FIND longest sencentce array
  RETRIEVE size
  REJOiN array into a string (" ")
  DISPLAY count and sentence
=end

file = File.read("frankenstein.txt")

sentences = file.split(/(?<=[.?!])/)

longest_split_sentence = []

sentences.each do |sentence|
  split_sentence = sentence.split(" ")
  if split_sentence.size > longest_split_sentence.size
    longest_split_sentence = split_sentence
  end
end


puts longest_split_sentence.join(" ") + " " + longest_split_sentence.size.to_s