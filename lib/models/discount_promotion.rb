class DiscountPromotion < PromotionalRule
  attr_accessor :item_id, :unit_discount_price

  def initialize(item_id, conditions, unit_discount_price)
    @item_id = item_id
    @conditions = conditions
    @unit_discount_price = unit_discount_price
  end

  def total_discount_price line
    unit_discount_price * line.quantity
  end

  def promtion_type
    ITEM
  end

end
