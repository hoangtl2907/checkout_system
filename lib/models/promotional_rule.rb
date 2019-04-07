class PromotionalRule
  attr_accessor :conditions

  ITEM = 'item'
  BASKET = 'basket'

  def satify_condition? line
    conditions.all? do |cond|
      atr = cond[:attribute]
      op = cond[:operator]
      val = cond[:value]
      line.send(atr).send(op, val)
    end
  end

end
