require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  # as soon as we call the deck class it should create an entire deck
  describe "#new" do
    it "automatically creates an entire deck of cards" do
      expect(deck.cards.count).to eq(52)
    end
  end

  describe "#create_deck" do
    it "shuffles the deck" do
      # Create an expected ordered deck of cards
      expected_ordered_deck = []
      Card::SYMBOLS.keys.each do |suit|
        Card::STRINGS.keys.each do |value|
          expected_ordered_deck << Card.new(suit, value)
        end
      end

      # Shuffle the deck
      deck.create_deck

      # Check if the shuffled deck is different from the expected ordered deck
      expect(deck.cards).not_to eq(expected_ordered_deck)
    end
  end
end
