require("minitest/autorun")
require_relative("../songs.rb")
require ("minitest/rg")

class SongTest < MiniTest::Test

  def setup

    @song1 = Song.new("Sunshine on Leith")
    @song2 = Song.new("Desolation Row")
    @song3 = Song.new("Master of Puppets")

  end

end
