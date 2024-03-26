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

  def place_bet
    # ask the user if they would like to fold, see, or raise
    puts "Would you like to (f)old, (s)ee, or (r)aise?"
    # get the user's choice
    user_choice = gets.chomp.downcase[0]
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

  def raise
    # ask the user how much they would like to raise
    puts "How much would you like to raise?"
    # get the user's choice and convert it to an integer
    raise_amount = Integer(gets.chomp)
    # subtract the raise amount from the player's bankroll
    self.bankroll -= raise_amount
    # add the raise amount to the pot
    self.pot += raise_amount
    # return the raise amount
    raise_amount
  end

  def see(current_amount)
    # subtract the current amount from the player's bankroll
    self.bankroll -= current_amount
    # add the current amount to the pot
    self.pot += current_amount
  end

  def discard
    # ask the user which cards they would like to discard
    puts "What would you like to discard?"
    # get user input, split it by commas, and convert each part to an integer
    user_choice = gets.chomp.split(",").map(&:to_i)
    # sort the user's choices in descending order to avoid index shift when deleting and delete the cards
    user_choice.sort.reverse.each { |choice| hand.cards.delete_at(choice - 1) }
  end
end
