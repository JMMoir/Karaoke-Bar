class Room

  attr_reader :name, :capacity, :playlist, :guests, :cost, :till

  def initialize(name, capacity, cost, till)
    @name = name
    @capacity = capacity
    @cost = cost
    @till = till
    @playlist = []
    @guests = []
  end

  def add_song_to_playlist(song)
    @playlist << song
    return @playlist
  end

  def check_in_guest(guest)
    @guests << guest
    return @guests.count
  end

  def check_guest_out(guest)
    @guests.delete(guest)
    return @guests.count
  end

  def check_in_group(group)
    for guest in group
      @guests << guest
    end
    return @guests.count
  end

  def check_out_group(group)
    check_in_group(group)
    for guest in group
      @guests.delete(guest)
    end
    return @guests.count
  end

  def check_capacity(group)
    check_in_group(group)
    if @guests.length > @capacity
      check_out_group(group)
      p "Sorry there are too many of you"
    else
      p "sing"
    end
  end

  def guest_has_paid_for_room(room)
    @till += room.cost
  end

end
