require("minitest/autorun")
require_relative("../river.rb")
require_relative("../fish.rb")

class TestRiver < MiniTest::Test

  def setup

    @fish1 = Fish.new("Trout")
    @fish2 = Fish.new("Kipper")
    @fish3 = Fish.new("Salmon")
    @fish4 = Fish.new("Mackerel")
    @fish5 = Fish.new("Tuna")


    @water = [@fish1, @fish2, @fish3]

    @river = River.new("Amazon", @water)

  end

  def test_river_name
    result = @river.name()
    assert_equal("Amazon", result)
  end

  def test_fish_in_water
    result = @river.water()
    assert_equal(@water, result)
  end

  def test_count_fish_in_water
    result = @river.count_fish_in_water()
    assert_equal(3, result)
  end

  def test_add_fish
    @river.add_fish(@fish4)
    result = @river.count_fish_in_water()
    assert_equal(4, result)
  end

  def test_return_water_array
    result = @river.return_water_array
    assert_equal(@water, result)
  end

  def test_remove_fish_from_river
    @river.remove_fish_from_river(@fish2)
    result = @river.count_fish_in_water()
    assert_equal(2, result)
  end

  def test_a_fish_is_born
    @river.a_fish_is_born("Terry")
    result = @river.count_fish_in_water()
    assert_equal(4, result)
  end
  
end
