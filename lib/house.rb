require 'pry'

class House

  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price.slice(1..-1).to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end

  # def area
  #   total_area = 0
  #   @rooms.each do |room|
  #     total_area += room.area
  #   end
  #   total_area
  # end

  def price_per_square_foot
    (@price.to_f / area).round(2)
  end

  def rooms_sorted_by_area
    sorted_by_area = @rooms.sort_by do |room|
      room.area
    end
    sorted_by_area.reverse
  end

  def rooms_by_category
    @rooms.group_by do |room|
      room.category
    end
  end

end
