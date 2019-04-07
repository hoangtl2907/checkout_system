class BasketPromotion < PromotionalRule
  attr_accessor :discount_rate

  def initialize(conditions, discount_rate)
    @conditions = conditions
    @discount_rate = discount_rate
  end

  def total_discount_price basket
    basket.total_original_price - (basket.total_original_price * discount_rate / 100)
  end

  def promtion_type
    BASKET
  end

end
