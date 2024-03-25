require_relative 'deck'

class Hand

  attr_accessor :cards

  def initialize
    # create an empty array to store the cards
    @cards = []
  end

  # deal a hand of cards from the deck
  def deal_hand(deck)
    @cards = deck.deal(5)
  end
end
