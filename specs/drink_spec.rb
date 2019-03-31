require('minitest/autorun')
require('MiniTest/rg')
require_relative('../drink')

class DrinkTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Beer", 4)
  end

  def test_correct_setup
    assert_equal("Beer", @drink1.drink_name)
    assert_equal(4, @drink1.price)
  end

end
