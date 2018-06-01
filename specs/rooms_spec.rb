require("minitest/autorun")
require_relative("../rooms.rb")
require_relative("../songs.rb")
require_relative("../guests.rb")
require ("minitest/rg")

class RoomTest < MiniTest::Test

  def setup

    @room1 = Room.new("1", [], [@song1], 3, 25)
    @room2 = Room.new("2", [@guest1, @guest2], [@song3], 2, 140)
    @guest1 = Guest.new("James", 50)
    @guest2 = Guest.new("Neil", 35)
    @guest3 = Guest.new("Stella", 120)
    @song1 = Song.new("Sunshine on Leith")
    @song2 = Song.new("Desolation Row")
    @song3 = Song.new("Master of Puppets")

  end

  def test_count_guests_in_room
    assert_equal(2, @room2.count_guests_in_room())
  end

  def test_count_songs_in_room
    assert_equal(1, @room1.count_songs_in_room())
  end

  def test_free_space
    assert_equal(0, @room2.free_space())
  end

  def test_sufficient_funds
    assert_equal(true, @room1.sufficient_funds(@guest1))
  end

  def test_check_in__space
    @room1.check_in(@guest1)
    assert_equal(1, @room1.count_guests_in_room())
  end

  def test_check_in__no_space
    @room2.check_in(@guest1)
    assert_equal("Unable to complete check-in process. This is either because the room is full or because you do not have enough money to pay the entry fee.", @room2.check_in(@guest1))
  end

  def test_money_down
    assert_equal(25, @room1.money_down(@guest1))
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
