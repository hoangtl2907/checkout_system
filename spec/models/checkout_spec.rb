require 'models/checkout'
require 'models/item'

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

end
