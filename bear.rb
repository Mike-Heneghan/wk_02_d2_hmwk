class Bear

  attr_reader :name, :stomach

  def initialize(input_name)
    @name = input_name
    @stomach = []
  end

  def count_fish_in_stomach
    return @stomach.length()
  end

  def add_fish_to_stomach(fish)
    return @stomach.push(fish)
  end

  def is_bear_starving?
    return @stomach.empty?()
  end

  def hunt_for_fish(river)
    hunting_ground = river.return_water_array()
    @stomach.push(hunting_ground.shift())
  end

  def digest()
    return @stomach.clear()
  end

  def hunt_for_set_fish(river, fish_number)
    if fish_number <=  river.count_fish_in_water
      hunting_ground = river.return_water_array()
      @stomach.concat(hunting_ground.shift(fish_number))
    end
  end

end
