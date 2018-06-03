require("minitest/autorun")
require_relative("../guests.rb")
require_relative("../rooms.rb")
require ("minitest/rg")

class GuestTest < MiniTest::Test

  def setup

    @guest1 = Guest.new("James", 50, "Sunshine on Leith")
    @guest2 = Guest.new("Neil", 35, "Master of Puppets")
    @guest3 = Guest.new("Stella", 120, "Desolation Row")

  end

  def test_guest_money
    assert_equal(50, @guest1.guest_money())
  end

end
