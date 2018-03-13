require("minitest/autorun")
require_relative("../bear.rb")
require_relative("../fish.rb")
require_relative("../river.rb")

class TestBear < MiniTest::Test

  def setup

    @bear1 = Bear.new("Yogi")

    @fish1 = Fish.new("Trout")
    @fish2 = Fish.new("Kipper")
    @fish3 = Fish.new("Salmon")
    @fish4 = Fish.new("Mackerel")
    @fish5 = Fish.new("Tuna")

    @water = [@fish1, @fish2, @fish3]
    @river = River.new("Amazon", @water)

    @water2 = [@fish1, @fish2, @fish3, @fish4, @fish5]
    @river2 = River.new("Tay", @water2)

  end

  def test_bear_has_name
    result = @bear1.name()
    assert_equal("Yogi", result)
  end

  def test_stomach_is_empty_array
    result = @bear1.stomach()
    assert_equal([],result)
  end

  def test_count_fish_in_stomach
    result = @bear1.count_fish_in_stomach()
    assert_equal(0,result)
  end

  def test_add_fish_to_stomach
    @bear1.add_fish_to_stomach(@fish2)
    result = @bear1.count_fish_in_stomach()
    assert_equal(1, result)
  end

  def test_is_bear_starving__true?
    result = @bear1.is_bear_starving?
    assert_equal(true, result)
  end

  def test_is_bear_starving__false?
    @bear1.add_fish_to_stomach(@fish2)
    result = @bear1.is_bear_starving?
    assert_equal(false, result)
  end

  def test_hunt_for_fish__fish_in_stomach
    @bear1.hunt_for_fish(@river)
    result = @bear1.count_fish_in_stomach()
    assert_equal(1, result)
  end

  def test_hunt_for_fish__fish_out_of_river
    @bear1.hunt_for_fish(@river)
    result = @river.count_fish_in_water()
    assert_equal(2, result)
  end

  def test_hunt_for_fish__many_fish_in_stomach
    @bear1.hunt_for_fish(@river)
    @bear1.hunt_for_fish(@river)
    result = @bear1.count_fish_in_stomach()
    assert_equal(2, result)
  end

  def test_hunt_for_fish__many_fish_out_of_river
    @bear1.hunt_for_fish(@river)
    @bear1.hunt_for_fish(@river)
    result = @river.count_fish_in_water()
    assert_equal(1, result)
  end

  def test_for_digest
    @bear1.add_fish_to_stomach(@fish1)
    @bear1.add_fish_to_stomach(@fish2)
    @bear1.digest()
    result = @bear1.count_fish_in_stomach()
    assert_equal(0, result)
  end

  def test_hunt_for_set_fish__fish_available

    @bear1.hunt_for_set_fish(@river2, 3)
    river_amount = @river2.count_fish_in_water()
    stomach_amount = @bear1.count_fish_in_stomach()
    assert_equal(2, river_amount)
    assert_equal(3, stomach_amount)

  end

  def test_hunt_for_set_fish__fish_not_available

    @bear1.hunt_for_set_fish(@river2, 6)
    river_amount =    @river2.count_fish_in_water()
    stomach_amount = @bear1.count_fish_in_stomach()
    assert_equal(5, river_amount)
    assert_equal(0, stomach_amount)

  end

end
