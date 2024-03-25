require_relative 'card'

class Deck

  # create a getter method for the instance variable cards
  attr_accessor :cards

  # constructor method that instantly calls the create_deck method
  def initialize
    create_deck
  end

  def create_deck
    # create an empty array to store the cards
    @cards = []

    # use the Card namespace to iterate through the suits and value hashmaps
    Card::SYMBOLS.keys.each do |suit|
      Card::STRINGS.keys.each do |value|
        # create a new card instance and add it to the cards array
        @cards << Card.new(suit, value)
      end
    end
    # call the shuffle! method to shuffle the cards
    @cards.shuffle!
  end

  # deal a specific number of cards from the deck
  def deal(num)
    @cards.shift(num)
  end

  # return the cards to the deck
  def return(cards)
    @cards.concat(cards)
  end
end
