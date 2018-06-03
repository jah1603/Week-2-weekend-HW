require("minitest/autorun")
require_relative("../rooms.rb")
require_relative("../songs.rb")
require_relative("../guests.rb")
require ("minitest/rg")

class RoomTest < MiniTest::Test

  def setup

    @guest1 = Guest.new("James", 150, "Sunshine on Leith")
    @guest2 = Guest.new("Neil", 35, "Master of Puppets")
    @guest3 = Guest.new("Stella", 120, "Desolation Row")
    @room1 = Room.new("1", [], [@song1], 3, 25)
    @room2 = Room.new("2", [@guest3], [@song3], 2, 140)
    @song1 = Song.new("Sunshine on Leith")
    @song2 = Song.new("Desolation Row")
    @song3 = Song.new("Master of Puppets")

  end

  def test_count_guests_in_room
    assert_equal(1, @room2.count_guests_in_room())
  end

  def test_count_songs_in_room
    assert_equal(1, @room1.count_songs_in_room())
  end

  def test_free_space__space
    assert_equal(3, @room1.free_space())
  end

  def test_sufficient_funds
    assert_equal(true, @room1.sufficient_funds(@guest1))
  end

  def test_in_room__no_guest
    assert_nil(@room1.in_room(@guest1))
  end

  def test_in_room__guest
    assert_equal("This guest is in the room already.", @room2.in_room(@guest3))
  end

  def test_favourite_song
    assert_equal("Wooo!", @room1.favourite_song(@guest1))
  end

  def test_check_in__space
    @room1.check_in(@guest1)
    assert_equal(1, @room1.count_guests_in_room())
    assert_equal(125, @room1.money_down(@guest1))
  end

  def test_check_in__no_space
    @room2.check_in(@guest1)
    @room2.check_in(@guest2)
    assert_equal(2, @room2.count_guests_in_room())
    assert_equal("This room is full.", @room2.free_space())
  end

  def test_check_in__insufficient_funds
    @room2.check_in(@guest2)
    assert_equal(1, @room2.count_guests_in_room())
    assert_equal("Insufficient funds to pay entry fee.", @room2.money_down(@guest2))
  end

  def test_check_in__insufficient_funds
    @room2.check_in(@guest3)
    assert_equal(1, @room2.count_guests_in_room())
    assert_equal("This guest is in the room already.", @room2.in_room(@guest3))
  end

  def test_money_down__sufficient_funds
    assert_equal(125, @room1.money_down(@guest1))
  end

  def test_money_down__insufficient_funds
    assert_equal("Insufficient funds to pay entry fee.", @room2.money_down(@guest2))
  end

  def test_check_out
    @room1.check_out(1)
    assert_equal(0, @room1.count_guests_in_room())
  end

  def test_add_song
    @room1.add_song(@song2)
    assert_equal(2, @room1.count_songs_in_room())
  end

end
