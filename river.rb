class River

attr_reader :name, :water

  def initialize(input_name, input_water)
    @name = input_name
    @water = input_water
  end

  def count_fish_in_water
    return @water.count()
  end

  def add_fish(fish_to_add)
    return @water << fish_to_add
  end

  def return_water_array
    return @water
  end

  def remove_fish_from_river(fish)
    return @water.delete(fish)
  end

  def a_fish_is_born(name)
    newborn_fish = Fish.new(name)
    add_fish(newborn_fish)
  end
  
end
