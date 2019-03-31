require('minitest/autorun')
require('MiniTest/rg')
require_relative('../bar')
require_relative('../guest')
require_relative('../drink')
require('pry')


class BarTest < MiniTest::Test

  def setup
    @bar = Bar.new("Karaoke Bar", 0)

    @drink1 = Drink.new("Beer", 4)

    @guest1 = Guest.new("John","Bohemian Rhapsody", 20)
  end

  def test_correct_setup
    assert_equal("Karaoke Bar", @bar.name)
    assert_equal(0, @bar.till)
  end

  def test_guest_buys_drink
    @bar.guest_buy_drink(@guest1, @drink1)
    assert_equal(4, @bar.till)
    assert_equal(16, @guest1.cash)
  end

  def test_tab
    @bar.add_to_tab(@drink1)
    assert_equal(4, @bar.tab1)
  end

  def test_settle_tab
    @bar.add_to_tab(@drink1)
    @bar.settle_tab(@guest1)
    assert_equal(16, @guest1.cash)
    assert_equal(4, @bar.till)
    assert_equal(0, @bar.tab1)
  end

end
