require "minitest/autorun"
require_relative "day4.rb"

class Day4Test < Minitest::Test
  def test_should_get_encrypted_name_from_room_name
    decrypted = Decrypter.new "dfcxsqhwzs-foppwh-difqvogwbu-454[fwdho]"

    assert_equal "dfcxsqhwzsfoppwhdifqvogwbu", decrypted.encrypted_name
  end

  def test_should_get_sector_id_from_room_name
    decrypted = Decrypter.new "dfcxsqhwzs-foppwh-difqvogwbu-454[fwdho]"

    assert_equal 454, decrypted.sector_id
  end

  def test_should_get_checksum_from_room_name
    decrypted = Decrypter.new "dfcxsqhwzs-foppwh-difqvogwbu-454[fwdho]"

    assert_equal "fwdho", decrypted.checksum
  end

  def test_should_get_top_five_characters
    decrypted = Decrypter.new "dfcxsqhwzs-foppwh-difqvogwbu-454[fwdho]"

    assert_equal ["f", "w", "d", "h", "o"], decrypted.top_five_characters
  end

  def test_should_be_true_if_real
    decrypted = Decrypter.new "dfcxsqhwzs-foppwh-difqvogwbu-454[fwdho]"

    assert_equal true, decrypted.is_real?
  end

  def test_should_be_false_if_decoy
    decrypted = Decrypter.new "totally-real-room-200[decoy]"

    assert_equal false, decrypted.is_real?
  end
end
