require('minitest/autorun')
require('MiniTest/rg')
require_relative('../bar')
require_relative('../guest')


class BarTest < MiniTest::Test

  def setup
    @bar = Bar.new("Karaoke Bar", 0)
  end

  def test_correct_setup
    assert_equal("Karaoke Bar", @bar.name)
    assert_equal(0, @bar.till)
  end

  def test_guest_buys_drink
    assert_equal(4, @bar.till)
  end
  
end
