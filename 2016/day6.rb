class CodeBreaker
  attr_reader :letter_hash

  def initialize input
    @input = input
    @letter_hash = {}
    categorize_letters
    @message = ""
  end

  def sort_into_columns first_line
    columns = first_line.split("")
    last_index = columns.length - 1
    columns.each_with_index do |column, index|
      if index != last_index
        @letter_hash["column_#{index}"] = []
      end
    end
  end

  def store_letters line
    letters = line.split("")
    last_index = letters.length - 1
    letters.each_with_index do |letter, index|
      if index != last_index
        store_by_frequency index
        @letter_hash["column_#{index}"] << letter
      end
    end
  end

  def categorize_letters
    index = 0
    @input.each_line do |line|
      sort_into_columns line if index == 0
      store_letters line
      index +=1
    end
  end

  def message_length
    num = 0
    size = 0
    @input.each_line do |line|
      size += line.length if num == 0
      num += 1
    end
    size
  end

  def store_by_frequency index
    hash = {}
    @letter_hash["column_#{index}"].each do |letter|
      hash[letter] ? hash[letter] += 1 : hash[letter] = 1
    end
    hash
  end

  def message
    last = message_length - 1
    index = 0
    until index == last
      la = store_by_frequency index
      highest = la.sort_by { |k, v| v }.reverse[0].first
      @message << highest
      index += 1
    end
    @message
  end

end

input = File.open("day6_input.txt").read
breaker = CodeBreaker.new input
puts "The message is: #{breaker.message}."
