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

  # create an array of the integer values of the cards
  def get_card_values
    # iterate through the cards array and return the integer value of each card
    @cards.map { |card| card.get_integer }
  end

  # create an array of the suit values of the cards
  def get_suit_values
    # iterate through the cards array and return the suit value of each card
    @cards.map { |card| card.get_suit }
  end

  # create a hash of the frequency of each card
  def get_frequency
    # create an array of the integer values of the cards and create an empty hash
    values = get_card_values
    # create a hash with a default value of 0
    card_freqs = Hash.new(0)
  end
end
