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
  describe "#deal" do
    context "when dealing a single card" do
      it "removes the top card from the deck" do
        original_deck_size = deck.cards.size
        dealt_card = deck.deal(1).first

        # make sure the card is taken out of the deck
        expect(deck.cards.size).to eq(original_deck_size - 1)
        # checks that the dealt card is not in the deck
        expect(deck.cards).not_to include(dealt_card)
      end
    end

    context "when dealing multiple cards" do
      it "removes the specified number of cards from the top of the deck" do
        original_deck_size = deck.cards.size
        dealt_cards = deck.deal(5)

        # make sure the cards are taken out of the deck
        expect(deck.cards.size).to eq(original_deck_size - 5)
        # checks that the dealt cards are not in the deck
        expect(deck.cards & dealt_cards).to be_empty
      end
    end
  end
  describe "#return" do
    # take 3 cards from the deck
    let(:cards) { deck.deal(3) }

    it "adds the cards back to the deck" do
      # set the original deck size
      original_deck_size = deck.cards.size
      # return the cards to the deck
      deck.return(cards)
      # expect the size to equal the original size
      expect(deck.cards.size).to eq(original_deck_size)
      # expect the cards to be in the deck
      expect(deck.cards).to include(*cards)
    end
  end
end
