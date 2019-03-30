require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')



class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new("Room 1", 6)

    @song1 = Song.new("Bohemian Rhapsody")

    @guest1 = Guest.new("John", "Bohemian Rhapsody", 20)
  end

  def test_room_has_name_and_capacity
    assert_equal("Room 1", @room1.name)
    assert_equal(6, @room1.capacity)
  end

  def test_room_has_playlist
    assert_equal([], @room1.playlist)
  end

  def test_room_has_song_in_playlist
    assert_equal(1, @room1.add_song_to_playlist(@song1))
  end

  def test_check_in_guest
    assert_equal(1, @room1.check_in_guest(@guest1))
  end

  def test_check_guest_out
    @room1.check_in_guest(@guest1)
    assert_equal(0, @room1.check_guest_out(@guest1))
  end

end
