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

  def price_per_square_foot
    (price_to_float / area).round(2)
  end

  def price_to_float # helper to price_per_square_foot
    price_array = @price.chars.map do |char|
      char.to_i
    end
    price_float = price_array.join.to_f
  end

  def rooms_sorted_by_area
    @rooms.sort do |room_1, room_2|
      room_2.area <=> room_1.area
    end
  end

  def rooms_by_category
    categories = create_category_hash
    add_arrays(categories)
  end

  def create_category_hash # helper to rooms_by_category
    categories = {}
    @rooms.each do |room|
      categories[room.category] = []
    end
    return categories
  end

  def add_arrays(categories) # helper to rooms_by_category
    categories.each do |category, array|
      array = @rooms.select do |room|
        room.category == category
      end
      categories[category] = array
    end
  end

end
