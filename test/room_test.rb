require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/room'

class RoomTest < Minitest::Test

  def test_it_exists
    bedroom_1 = Room.new(:bedroom, 11, 12)

    assert_instance_of Room, bedroom_1
  end

end
