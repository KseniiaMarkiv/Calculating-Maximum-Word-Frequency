#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number
	
  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    self.calculate_word_frequency(content)   
  end  
	
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


class Solution
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  def initialize
    @analyzers = []
    @highest_count_words_across_lines = nil
    @highest_count_across_lines = nil
  end

 def analyze_file
    @analyzers = []
    line_number = 0      
  File.foreach( 'test.txt' ) do |line|      
    line_number += 1      
    @analyzers << LineAnalyzer.new(line.chomp, line_number)    
  end 
  end

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
  
  def print_highest_word_frequency_across_lines
    puts "The following words have the highest word frequency per line:"
    @highest_count_words_across_lines.reverse_each{|ob| print ob.highest_wf_words, " (appears in line ", ob.line_number, ")\n"}  
  end
 
end

##### Test of solution from assignment

solution = Solution.new
#expect errors until you implement these methods
solution.analyze_file
solution.calculate_line_with_highest_frequency
solution.print_highest_word_frequency_across_lines



##### it's my test 

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

