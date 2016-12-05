class Decrypter
  attr_reader :encrypted_name, :sector_id, :checksum

  def initialize room
    @encrypted_name = /.+-/.match(room)[0].gsub "-", ""
    @sector_id = /\d+/.match(room)[0].to_i
    @checksum = /\[\w+\]/.match(room)[0].gsub /(\[|\])/, ""
    @top_five = top_five_characters
  end

  def is_real?
    checksum_arr = @checksum.split("")
    reality_check = false
    checksum_arr.each do |num|
      if @top_five.include? num
        reality_check = true
      else
        reality_check = false
        break
      end
    end
    reality_check
  end

  def characters_hash
    characters = {}
    encrypted_chars = @encrypted_name.split("")
    encrypted_chars.each do |char|
      characters[char] ? characters[char] += 1 : characters[char] = 1
    end
    characters
  end

  def top_five_characters
    alphabetized_hash = {}
    alphabetized_arr = characters_hash.sort_by { |k, v| alphabetized_hash[v] = [] }
    top_vals = characters_hash.sort_by { |k, v| v }.reverse.first(5).map(&:last).uniq
    characters_arr = characters_hash.sort_by { |k, v| v }

    alphabetized_arr.each do |pair|
      char = pair[0]
      num = pair[1]
      if top_vals.include? num
        alphabetized_hash[num] << char
        alphabetized_hash[num].sort!
      end
    end

    top_sorted_chars =  []
    sorted_arr = alphabetized_hash.sort_by { |k, v| k }.reverse
    sorted_arr.each_with_index do |pair, index|
      letters = pair[1]
      letters.each { |letter| top_sorted_chars << letter }
    end

    top_sorted_chars.first(5)
  end
end

text = File.open("day4_input.txt").read
sum = 0
text.each_line do |line|
  decrypted = Decrypter.new line
  if decrypted.is_real?
    sum += decrypted.sector_id
  end
end

puts "The sum of the sector IDs of the real rooms is: #{sum}."
