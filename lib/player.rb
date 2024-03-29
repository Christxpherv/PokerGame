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
    # create an array of valid choices
    valid_choices = ['f', 's', 'r']
    # loop until the user enters a valid choice
    loop do
      puts "Would you like to (f)old, (s)ee, or (r)aise?"
      # get the user's choice and convert it to lowercase
      user_choice = gets.chomp.downcase
      # check if the user's choice is valid
      if valid_choices.include?(user_choice)
        return user_choice
      # if the user's choice is not valid, output an error message
      else
        puts "Invalid choice. Please enter 'f', 's', or 'r'."
      end
    end
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

  def raiseBet
    valid_raise = false
    while !valid_raise
      # ask the user how much they would like to raise
      puts "How much would you like to raise?"
       # get the user's choice and convert it to an integer
      raise_amount = Integer(gets.chomp)
      # check if the raise amount is greater than the player's bankroll
      if raise_amount > bankroll
        # if the raise amount is greater than the player's bankroll, output an error message
        puts "You don't have enough money to raise that amount. Your bankroll is $#{bankroll}."
      else
        # if the raise amount is valid, set valid_raise to true
        valid_raise = true
        # subtract the raise amount from the player's bankroll
        self.bankroll -= raise_amount
        # add the raise amount to the pot
        self.pot += raise_amount
      end
    end
    raise_amount
  end

  def see(current_amount)
    # subtract the current amount from the player's bankroll
    self.bankroll -= current_amount
    # add the current amount to the pot
    self.pot += current_amount
  end

  def discard
    puts "What would you like to discard?"
    # get the user's choice and convert it to an array of integers
    user_choice = gets.chomp.split(",").map(&:to_i)
    # iterate through the user's choice and remove the cards from the player's hand
    discarded_cards = user_choice.sort.reverse.map { |choice| hand.cards.delete_at(choice - 1) }
    # return the discarded cards
    discarded_cards
  end

  def trade_cards(old_cards, new_cards)
    # remove the old cards from the player's hand and add the new cards
    hand.replace_cards(old_cards, new_cards)
  end

  def return_cards
    # store the cards currently held in the player's hand
    cards = hand.cards
    # clear the player's hand by assigning an empty array to it
    self.hand.cards = []
     # return the cards that were previously held in the player's hand
    cards
  end

  # add argument to receive_winnings method
  def receive_winnings(pot)
    # add the pot to the player's bankroll
    self.bankroll += pot
  end
end
