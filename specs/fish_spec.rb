require("minitest/autorun")
require_relative("../fish.rb")

class TestFish < MiniTest::Test

def setup
  @fish1 = Fish.new("Trout")
  @fish2 = Fish.new("Kipper")
  @fish3 = Fish.new("Salmon")
end

def test_fish_species
  result = @fish2.species()
  assert_equal("Kipper", result)
end

end
