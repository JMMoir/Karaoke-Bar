require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("John","Bohemian Rhapsody", 20)
  end

  def test_guest_has_name_song_wallet
    assert_equal("John", @guest1.name)
    assert_equal("Bohemian Rhapsody", @guest1.fav_song)
    assert_equal(20, @guest1.cash)
  end


end
