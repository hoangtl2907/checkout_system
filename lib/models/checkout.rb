class Checkout 
  attr_accessor :promotional_rules
  def initialize promotional_rules = {}
    @promotional_rules = promotional_rules
    @basket = {}
  end

  def scan item
    if @basket.has_key? item.id
      @basket[item.id].inc_one_quantity
    else
      @basket[item.id] = CheckoutLine.new(item)
    end
  end

  def total
    return 0 if @basket.length == 0
    @basket.values.reduce(0) do |sum, line|
      sum += line.total_price
    end
  end
end
