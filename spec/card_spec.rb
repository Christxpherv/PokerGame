require 'card'

RSpec.describe Card do

  subject(:card) { Card.new("Hearts", "10") }

  describe '#initialize' do
    it 'creates a card with a suit and a value' do
      expect(card.suit).to eq("Hearts")
      expect(card.value).to eq("10")
    end
  end
end
