class Room

attr_reader(:name, :guests, :songs, :capacity, :entry_fee)

  def initialize(name, guests, songs, capacity, entry_fee)
    @name = name
    @guests = guests
    @songs = songs
    @capacity = capacity
    @entry_fee = entry_fee
  end

  def count_guests_in_room()
    return @guests.length()
  end

  def count_songs_in_room()
    return @songs.length()
  end

  def free_space()
    if @capacity - @guests.length() > 0
      return @capacity - @guests.length()
    else
      return "This room is full."
    end
  end

  def sufficient_funds(guest)
    return true if guest.money >= @entry_fee
  end

  def money_down(guest)
    if guest.money >= @entry_fee
      return guest.money - @entry_fee
    else
      return "Insufficient funds to pay entry fee."
    end
  end

  def in_room(guest)
    if @guests.include?(guest) == false
      return
    else
      return "This guest is in the room already."
    end
  end

  def check_in(guest)
    return money_down(guest) if guest.money < @entry_fee
    return free_space if @capacity - @guests.length() == 0
    return in_room(guest) if @guests.include?(guest) == true
    else
    return @guests.push(guest), money_down(guest)
  end

  def check_out(number_of_guests)
    @guests.drop(number_of_guests)
    # deletes first n elements of the guests array
  end

  def add_song(song)
    @songs.push(song)
  end

end
