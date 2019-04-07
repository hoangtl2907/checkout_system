class CheckoutLine
  attr_accessor :item_id, :quantity, :unit_price
  def initialize(item)
    @item_id = item.id
    @quantity = 1
    @unit_price = item.price
  end

  def inc_one_quantity
    @quantity += 1
  end

  def total_price
    total_price = unit_price * quantity
  end

end
