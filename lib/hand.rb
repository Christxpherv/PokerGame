require_relative 'deck'

class Hand

  attr_accessor :cards

  def initialize
    # create an empty array to store the cards
    @cards = []
  end
end
