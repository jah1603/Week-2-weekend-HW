class Guest

attr_reader(:name, :money)

  def initialize(name, money)
    @name = name
    @money = money
  end

  def guest_money()
    return @money
  end

end
