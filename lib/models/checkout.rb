class Checkout 
  attr_accessor :promotional_rules

  def initialize promotional_rules = []
    @promotional_rules = {}
    promotional_rules.each do |rule|
      if rule.promtion_type == PromotionalRule::BASKET
        @basket_promotion = rule 
      else
        @promotional_rules.update(rule.item_id => rule)
      end
    end
    @basket = {}
  end

  def scan item
    if @basket.has_key? item.id
      @basket[item.id].inc_one_quantity
    else
      @basket[item.id] = CheckoutLine.new(item, @promotional_rules[item.id])
    end
  end

  def total
    return 0 if @basket.length == 0
    is_discounted? ? total_price_with_promotion : total_original_price
  end

  def total_original_price
    total = @basket.values.reduce(0) do |sum, line|
      sum += line.total_price
    end
  end

  def total_price_with_promotion
    @basket_promotion.total_discount_price self
  end

  def has_promotion?
    !@basket_promotion.nil?
  end

  def is_discounted?
    return false if !has_promotion?
    @basket_promotion.satify_condition? self
  end

end
