require 'deck'

describe Deck do
  # create a new instance of the Deck class
  subject(:deck) { Deck.new }

  # as soon as we call the deck class it should create an entire deck
  describe "#new" do
    it "automatically creates an entire deck of cards" do
      expect(deck.cards.count).to eq(52)
    end
  end
end
