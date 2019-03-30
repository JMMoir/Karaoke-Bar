class Room

  attr_reader :name, :capacity, :playlist, :guests

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @playlist = []
    @guests = []
  end

  def add_song_to_playlist(song)
    @playlist << song
    return @playlist.count
  end

  def check_in_guest(guest)
    @guests << guest
    return @guests.count
  end

  def check_guest_out(guest)
    @guests.delete(guest)
    return @guests.count
  end

end
