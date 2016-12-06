require "digest"

class PasswordGenerator
  attr_reader :index, :password

  def initialize door_id
    @door_id = door_id
    @index = 0
    @password = ""
    find_password
  end

  def fronted_by_five_zeroes
    matched = false

    until matched
      md5 = Digest::MD5.new
      hash = md5.hexdigest "#{@door_id}#{@index}"
      if /^0{5,}.+/.match hash
        matched = true
      end
      @index += 1
    end
    hash
  end

  def find_password
    until @password.length == 8
      @password << fronted_by_five_zeroes[5]
    end
  end
end


pass_gen = PasswordGenerator.new "ugkcyxxp"
puts "The password is: #{pass_gen.password}."
