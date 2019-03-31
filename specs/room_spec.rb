require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')
require('pry')



class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new("Room 1", 2, 5, 0)

    @song1 = Song.new("Bohemian Rhapsody")

    @songs = [Song.new("Bohemian Rhapsody"),Song.new("Thunder Road"),Song.new("I walk the line")]

    @guest1 = Guest.new("John", "Bohemian Rhapsody", 20)
    @guest2 = Guest.new("Claire", "I walk the line", 25)

    @group1 = [@guest1, @guest1, @guest2]
    @group2 = [@guest1, @guest2]
  end

  def test_room_has_name_and_capacity_cost
    assert_equal("Room 1", @room1.name)
    assert_equal(2, @room1.capacity)
    assert_equal(5, @room1.cost)
  end

  def test_room_has_playlist
    assert_equal([], @room1.playlist)
  end
## test passed but function amended to be called in other function
  # def test_room_has_song_in_playlist
  #   assert_equal(1, @room1.add_song_to_playlist(@song1))
  # end

  def test_check_in_guest
    assert_equal(1, @room1.check_in_guest(@guest1))
  end

  def test_check_guest_out
    @room1.check_in_guest(@guest1)
    assert_equal(0, @room1.check_guest_out(@guest1))
  end

  def test_check_in_group
    assert_equal(3, @room1.check_in_group(@group1))
  end

  def test_group_check_out
    assert_equal(0, @room1.check_out_group(@group1))
  end

  def test_check_room_over_capacity
    assert_equal("Sorry there are too many of you", @room1.check_capacity(@group1))
  end

  def test_check_room_under_capacity
    assert_equal("sing", @room1.check_capacity(@group2))
  end

  def test_guest_has_paid_for_room
    @room1.guest_has_paid_for_room(@room1)
    assert_equal(5, @room1.till)
  end

  def test_songs_array
    assert_equal(3, @room1.songs_array_length(@songs))
  end

  def test_search_array_add_to_playlist
    assert_equal(1, @room1.search_array_add_to_playlist(@songs))
  end

  def test_search_array_add_to_playlist_not_found
    assert_equal("Not found", @room1.search_array_add_to_playlist(@songs))
  end
end
