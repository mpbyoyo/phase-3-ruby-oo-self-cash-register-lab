class CashRegister
  def initialize(discount = 0)
    @discount = discount
    @total = 0.0
    @list = []
    @prices = []
  end
  attr_accessor :total
  attr_reader :discount 

  

  def add_item(title, price, q = 1)
    q.times {|i| @list << {title: title, price: price}}
    @prices << price * q
    @total += price * q
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end
    @total = @total-(@total * (@discount/100.0))
    "After the discount, the total comes to $#{@total.to_s[/[^.]+/]}."
  end

  def items
    @list.map {|i| i[:title]}
  end

  def void_last_transaction
    @total -= @prices.last
    @prices.pop
  end
end