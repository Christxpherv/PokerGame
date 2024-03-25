require 'card'

RSpec.describe Card do

  subject(:card) { Card.new(:Hearts, :Ten) }

  describe '#initialize' do
    it 'creates a card with a suit and a value' do
      expect(card.suit).to eq(:Hearts)
      expect(card.value).to eq(:Ten)
    end

    # test if the suit or value is invalid, it returns an error message
    it "should return an error if the suit or value is invalid" do
      expect { Card.new(:Hearts, :Eleven) }.to raise_error("invalid card, please verify the suit and value.")
    end
  end

  # get the value of the card as a string
  describe "#get_value" do
    it "returns string representation of value" do
      expect(card.get_value).to eq("10")
    end
  end

  # get the suit of the card as a string
  describe "#get_suit" do
    it "returns string of suit" do
      expect(card.get_suit).to eq("♥")
    end
  end

  # get the integer value of the card
  describe "get_integer" do
    it "gives an integer of value" do
      expect(card.get_integer).to eq(10)
    end
  end
end
