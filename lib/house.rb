require 'pry'

class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room (room)
    @rooms << room
  end

  def rooms_from_category(room_category)
    @rooms.select do |room|
      room.category == room_category
    end
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end

end
