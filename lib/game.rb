require_relative 'player'

class Game

  attr_accessor :players, :pot, :deck

  # constructor method that initializes the deck, players, and pot
  def initialize
    @deck = Deck.new
    @players = []
    @pot = 0
  end
end
