RSpec.describe CheckoutLine do

  context 'Without promotional rules' do
    let(:item1) {Item.new(1, "Lavender heart", 9.25)}

    it 'Increase quantity by one' do
      cl = CheckoutLine.new(item1)
      cl.inc_one_quantity
      expect(cl.quantity).to eq 2
      expect(cl.total_price).to eq 18.50
    end

  end

end
