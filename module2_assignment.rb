#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  # include Enumerable
  #Implement the following read-only attributes in the LineAnalyzer class. 
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content          - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)
	                                  ##############################################
  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    self.calculate_word_frequency(content)   
  end  
  #* calculate_word_frequency() - calculates result
  def calculate_word_frequency(content)
  @highest_wf_words = Array.new
      word_frequency = Hash.new(0) 
    content.split.each do |word|
      word_frequency[word.downcase] += 1
  end
  
  @highest_wf_count = word_frequency.values.max
  
  @highest_wf_words = word_frequency.select { |k, v| v == word_frequency.values.max if "#{v}".to_i > 1}.keys

  end
end


  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.

  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.


#  Implement a class called Solution. 
class Solution

  # Implement the following read-only attributes in the Solution class.
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
  #* analyzers - an array of LineAnalyzer objects for each line in the file
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.
  

  def initialize
    @analyzers = []
    @highest_count_words_across_lines = nil
    @highest_count_across_lines = nil
  end

  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
  #  highest_count_words_across_lines attribute values
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in 
  #  highest_count_words_across_lines in the specified format
  
  # Implement the analyze_file() method() to:
 def analyze_file
    @analyzers = []
    line_number = 0      
  File.foreach( 'test.txt' ) do |line|      
    line_number += 1      
    @analyzers << LineAnalyzer.new(line.chomp, line_number)    
  end 
  end
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

  # Implement the calculate_line_with_highest_frequency() method to:
  def calculate_line_with_highest_frequency
    @highest_count_words_across_lines = []
    @highest_count_across_lines = []

    @analyzers.each do |c, l_n|
       @highest_count_across_lines = c.highest_wf_count
    end
    
    @h = {}
    @h = @analyzers.each do |analyzer|
          analyzer.highest_wf_words
      end   
    
    @highest_count_words_across_lines = @h.select {|k| k.highest_wf_words.length >= 1 }.reverse

  
   
  end
  
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.


  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format
  def print_highest_word_frequency_across_lines
    puts "The following words have the highest word frequency per line:"
    @highest_count_words_across_lines.reverse_each{|ob| print ob.highest_wf_words, " (appears in line ", ob.line_number, ")\n"}  
  end
 
end

# lineAnalyzer = LineAnalyzer.new("test", 1)
# lineAnalyzer = LineAnalyzer.new("", 1)
# lineAnalyzer = LineAnalyzer.new("This is a really really really cool cool you you you", 2)
# p lineAnalyzer

# solution = Solution.new()
# p solution.analyzers.length
# solution.analyze_file
# p solution.analyzers.length
# p solution.highest_count_across_lines
# p solution.highest_count_words_across_lines

# solution.calculate_line_with_highest_frequency
# p solution.highest_count_across_lines
# words_found = solution.highest_count_words_across_lines.map(&:highest_wf_words).flatten
# p words_found
# solution.print_highest_word_frequency_across_lines

