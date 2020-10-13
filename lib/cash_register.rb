class CashRegister

  attr_accessor :total
  attr_reader :discount, :items

  def initialize(discount=0)
    @total = 0.0
    @previous_total = 0.0
    @last_quantity = 0
    self.discount = discount
    @items = []
  end

  def discount=(discount)
    if discount <= 0
      @discount = 0
    elsif discount >= 100
      @discount = 100
    else
      @discount = discount
    end
  end

  def add_item(title, price, quantity=1)
    @previous_total = @total
    @total += quantity * price
    @last_quantity = quantity
    quantity.times {@items << title}
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total = total - total * (@discount / 100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total = @previous_total
  end

end