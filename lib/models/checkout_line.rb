class CheckoutLine
  attr_accessor :item_id, :quantity, :unit_price, :discount_price

  def initialize(item, promotional_rule = nil)
    @item_id = item.id
    @quantity = 1
    @unit_price = item.price
    @promotional_rule = promotional_rule
  end

  def inc_one_quantity
    @quantity += 1
  end

  def total_price
    total_price = if is_discounted?
                    @promotional_rule.total_discount_price self
                  else
                    unit_price * quantity
                  end
  end

  def has_promotion?
    !@promotional_rule.nil?
  end

  def is_discounted?
    return false if !has_promotion?
    @promotional_rule.satify_condition? self
  end

end
