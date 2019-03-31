class Guest

attr_reader :name, :fav_song
attr_accessor :cash
  def initialize(name, fav_song, cash)
    @name = name
    @fav_song = fav_song
    @cash = cash
  end

  def guest_has_paid(room)
    @cash -= room.cost
  end

  def fav_song_in_playlist(room, guest, song)
    playlist = room.add_song_to_playlist(song)
    for song in playlist
      if song.title == guest.fav_song
        return "Whoo!"
      end
    end
  end
end
