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
    return @capacity - @guests.length()
  end

  def sufficient_funds(guest)
    return true if guest.money >= @entry_fee
  end

  def check_in(guest)
    return @guests.push(guest) if free_space > 0 && sufficient_funds = true
  else return "Unable to complete check-in process. This is either because the room is full or because you do not have enough money to pay the entry fee."
  end

  def money_down(guest)
  return guest.money - @entry_fee
  end


  def check_out(number_of_guests)
    @guests.drop(number_of_guests)
    # deletes first n elements of the guests array
  end

  def add_song(song)
    @songs.push(song)
  end

end
