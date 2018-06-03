class Guest

attr_reader(:name, :money, :favourite_song)

  def initialize(name, money, favourite_song)
    @name = name
    @money = money
    @favourite_song
  end

  def guest_money()
    return @money
  end

end
