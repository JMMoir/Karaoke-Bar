require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../room')
require_relative('../song')
require('pry')

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("John","Bohemian Rhapsody", 20)

    @room1 = Room.new("Room 1", 2, 5, 0)
    @song1 = Song.new("Bohemian Rhapsody")
  end

  def test_guest_has_name_song_cash
    assert_equal("John", @guest1.name)
    assert_equal("Bohemian Rhapsody", @guest1.fav_song)
    assert_equal(20, @guest1.cash)
  end

  def test_guest_has_paid
    @guest1.guest_has_paid(@room1)
    assert_equal(15, @guest1.cash)
  end

  def test_fav_song_in_playlist
    assert_equal("whoo!", @guest1.fav_song_in_playlist(@room1, @guest1, @song1))
  end
end
