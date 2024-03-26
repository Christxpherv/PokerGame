require_relative 'hand'

class Player

  # create getter and setter methods for the instance variables hand, bankroll, and pot
  attr_accessor :hand, :bankroll, :pot

  # constructor method to initialize the player with a bankroll and pot
  def initialize(bankroll, pot)
    @bankroll = bankroll
    @pot = pot
    @hand = Hand.new
    @over = false
  end

  # method to deal a player a hand of cards
  def deal_in(hand)
    # set the player's hand to the provided hand
    self.hand = hand
  end

  # fold method to set the player to folded
  def fold
    # set over to true
    @over = true
  end

  # unfold method to set the player to not folded
  def unfold
    # set over to false
    @over = false
  end

  # folded? method to check if the player is folded
  def folded?
    # return the value of over
    @over
  end
end
