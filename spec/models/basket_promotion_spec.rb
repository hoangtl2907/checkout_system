RSpec.describe BasketPromotion do
  let(:item2) {Item.new(2, "Personalised cufflinks", 45.00)}
  let (:promotional_rule) { BasketPromotion.new([{attribute: :total_original_price, operator: :>, value: 60}], 10) } 

  it 'Does not satify condition' do
    co = Checkout.new()
    co.scan(item2)
    expect(promotional_rule.satify_condition? co).to eq false
  end

  it 'Satify condition' do
    co = Checkout.new()
    co.scan(item2)
    co.scan(item2)
    expect(promotional_rule.satify_condition? co).to eq true
    expect(promotional_rule.total_discount_price co).to eq 81.00
  end
end
