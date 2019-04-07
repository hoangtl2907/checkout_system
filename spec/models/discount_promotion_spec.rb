RSpec.describe DiscountPromotion do
  let(:item1) {Item.new(1, "Lavender heart", 9.25)}
  let (:promotional_rule) { DiscountPromotion.new(1, [{attribute: :quantity, operator: :>, value: 1}], 8.50) } 
  let(:line) {CheckoutLine.new(item1, promotional_rule)}

  it 'Does not satify condition' do
    expect(promotional_rule.satify_condition? line).to eq false
  end

  it 'Satify condition' do
    line.inc_one_quantity
    expect(promotional_rule.satify_condition? line).to eq true
    expect(promotional_rule.total_discount_price line).to eq 17.00
  end

end
