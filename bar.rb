class Bar

  attr_reader :name, :till
  attr_accessor :tab1

  def initialize(name, till)
    @name = name
    @till = till
    @tab1 = 0
  end

  def guest_buy_drink(guest, drink)
    @till += drink.cost
    guest.guest_has_paid(drink)
  end

  def add_to_tab(drink)
    @tab1 += drink.cost
  end

  def settle_tab(guest)
    @till += @tab1
    guest.cash -= @tab1
    @tab1 = 0
  end

end
