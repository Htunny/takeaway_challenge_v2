class Takeaway

  attr_reader :menu, :show_menu

  def initialize
    @menu = {Burger: 5, Fries: 3, Shake: 2.50 }
  end

  def show_menu
    @menu.map do | dish, price |
     "%s £%.2f" % [dish, price]
   end.join(", ")
  end
end
