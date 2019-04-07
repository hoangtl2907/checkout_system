RSpec.describe Checkout do
  let(:item1) {Item.new(1, "Lavender heart", 9.25)}
  let(:item2) {Item.new(2, "Personalised cufflinks", 45.00)}
  let(:item3) {Item.new(3, "Kids T-shirt", 19.95)}

  context 'Without promotional rules' do
    it 'When basket has zero item' do
      co = Checkout.new()
      expect(co.total).to eq 0
    end

    it 'When basket has one item with quantity is equal one' do
      co = Checkout.new()
      co.scan(item1)
      expect(co.total).to eq 9.25
    end

    it 'When basket has one item with quantity is greater than one' do
      co = Checkout.new()
      co.scan(item1)
      co.scan(item1)
      expect(co.total).to eq 18.50
    end

    it 'When basket has more than one items and each item has quantity is equal one' do
      co = Checkout.new()
      co.scan(item1)
      co.scan(item2)
      co.scan(item3)
      expect(co.total).to eq 74.20
    end

    it 'When basket has more than one items and each item has quantity is greater than one' do
      co = Checkout.new()
      co.scan(item1)
      co.scan(item1)
      co.scan(item2)
      co.scan(item2)
      co.scan(item3)
      co.scan(item3)
      expect(co.total).to eq 148.4
    end

  end

  context 'With promotional rules' do
    let (:item_discount_rule) { DiscountPromotion.new(1, [{attribute: :quantity, operator: :>, value: 1}], 8.50) } 
    let (:basket_discount_rule) { BasketPromotion.new([{attribute: :total_original_price, operator: :>, value: 60}], 10) } 

    it 'When basket has zero item and has discount item rule' do
      rules = [item_discount_rule]
      co = Checkout.new(rules)
      expect(co.total).to eq 0
    end

    it 'When basket has one item with quantity is equal one and has discount item rule' do
      rules = [item_discount_rule]
      co = Checkout.new(rules)
      co.scan(item1)
      expect(co.total).to eq 9.25
    end

    it 'When basket has one item with quantity is greater than one and has discount item rule' do
      rules = [item_discount_rule]
      co = Checkout.new(rules)
      co.scan(item1)
      co.scan(item1)
      expect(co.total).to eq 17.00
    end

    it 'When basket has more than one items and each item has quantity is equal one and has discount item rule' do
      rules = [item_discount_rule]
      co = Checkout.new(rules)
      co.scan(item1)
      co.scan(item2)
      co.scan(item3)
      expect(co.total).to eq 74.20
    end

    it 'When basket has more than one items and each item has quantity is greater than one and has discount item rule' do
      rules = [item_discount_rule]
      co = Checkout.new(rules)
      co.scan(item1)
      co.scan(item1)
      co.scan(item2)
      co.scan(item2)
      co.scan(item3)
      co.scan(item3)
      expect(co.total).to eq 146.9
    end

    it 'When basket has zero item and has discount basket rule' do
      rules = [basket_discount_rule]
      co = Checkout.new(rules)
      expect(co.total).to eq 0
    end

    it 'When basket has one item with quantity is equal one and has discount basket rule' do
      rules = [basket_discount_rule]
      co = Checkout.new(rules)
      co.scan(item1)
      expect(co.total).to eq 9.25
    end

    it 'When basket has one item with quantity is greater than one and has discount basket rule' do
      rules = [basket_discount_rule]
      co = Checkout.new(rules)
      co.scan(item1)
      co.scan(item1)
      expect(co.total).to eq 18.5
    end

    it 'When basket has more than one items and each item has quantity is equal one and has discount basket rule' do
      rules = [basket_discount_rule]
      co = Checkout.new(rules)
      co.scan(item1)
      co.scan(item2)
      co.scan(item3)
      expect(co.total).to eq 66.78
    end

    it 'When basket has more than one items and each item has quantity is greater than one and has discount basket rule' do
      rules = [basket_discount_rule]
      co = Checkout.new(rules)
      co.scan(item1)
      co.scan(item1)
      co.scan(item2)
      co.scan(item2)
      co.scan(item3)
      co.scan(item3)
      expect(co.total).to eq 133.56
    end

    it 'When basket has zero item and has discount item and basket rules' do
      rules = [item_discount_rule, basket_discount_rule]
      co = Checkout.new(rules)
      expect(co.total).to eq 0
    end

    it 'When basket has one item with quantity is equal one and has discount item and basket rules' do
      rules = [item_discount_rule, basket_discount_rule]
      co = Checkout.new(rules)
      co.scan(item1)
      expect(co.total).to eq 9.25
    end

    it 'When basket has one item with quantity is greater than one and has discount item and basket rules' do
      rules = [item_discount_rule, basket_discount_rule]
      co = Checkout.new(rules)
      co.scan(item1)
      co.scan(item1)
      expect(co.total).to eq 17.00
    end

    it 'When basket has more than one items and each item has quantity is equal one and has discount item and basket rules' do
      rules = [item_discount_rule, basket_discount_rule]
      co = Checkout.new(rules)
      co.scan(item1)
      co.scan(item2)
      co.scan(item3)
      expect(co.total).to eq 66.78
    end

    it 'When basket has more than one items and each item has quantity is greater than one and has discount item and basket rules' do
      rules = [item_discount_rule, basket_discount_rule]
      co = Checkout.new(rules)
      co.scan(item1)
      co.scan(item1)
      co.scan(item2)
      co.scan(item2)
      co.scan(item3)
      co.scan(item3)
      expect(co.total).to eq 132.21
    end

  end

end
