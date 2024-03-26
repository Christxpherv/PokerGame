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

  # ----------------- rank methods -----------------

  def royal_flush?
    # check if the hand is a straight flush and if the highest card is an ace and the lowest card is a ten
    straight_flush? && get_card_values.max == 14 && get_card_values.min == 10
  end

  def straight_flush?
    # check if the hand is a flush and a straight
    flush? && straight?
  end

  def four_of_a_kind?
    # check if the hand has four cards of the same value
    card_frequency_calculator(4)
  end

  def full_house?
    # check if the hand has three cards of one value and two cards of another value
    card_frequency_calculator(3) && card_frequency_calculator(2)
  end

  def flush?
    # check if all cards have the same suit
    suits = get_suit_values
    suits.uniq.length == 1
  end

  def straight?
    # sort the cards and iterate through each index
    sorted_cards = get_card_values.sort

    sorted_cards.each_index do |i|
      # if we reach the last four cards, break the loop
      next if i > 3
      # return false if the next card is not one greater than the current card
      return false if (sorted_cards[i] + 1) != sorted_cards[i + 1]
    end
    # if no breaks were found in the sequence, return true indicating a straight
    true
  end

  def three_of_a_kind?
    # check if the hand has three cards of the same value
    card_frequency_calculator(3)
  end

  def two_pair?
    # check if the hand has two pairs
    values = get_card_values
    # create a variable to store the number of doubles
    doubles = 0

    # iterate through each index
    values.each_index do |i|
      # iterate through each index greater than the current index
      (i + 1).upto(values.length - 1) do |j|
        # increment the doubles variable if the values are the same
        doubles += 1 if values[i] == values[j]
      end
    end
    # return true if the number of doubles is 2
    doubles == 2
  end

  def pair?
  # check if the hand has one pair
    card_frequency_calculator(2)
  end

  def high_card?
    # check if the hand has no other combinations
    card_frequency_calculator(1)
   end

  # determine the rank of each hand
  def rank
    return 10 if royal_flush?
    return 9 if straight_flush?
    return 8 if four_of_a_kind?
    return 7 if full_house?
    return 6 if flush?
    return 5 if straight?
    return 4 if three_of_a_kind?
    return 3 if two_pair?
    return 2 if pair?
    return 1 if high_card?
  end

  # ----------------- comparison method ------------------

  # compare the hand to another hand
  def beats?(opponent)
    # check that trhe ranks are different
    unless rank == opponent.rank
      # compare the ranks of the hands
      rank > opponent.rank
    else
      # if ranks are equal, compare the highest card values
      highest_frequency_value > opponent.highest_frequency_value
    end
  end

  # ----------------- supporting methods -----------------

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

    # iterate through the values array and increment the frequency of each card
    values.each {|card| card_freqs[card] += 1}
    card_freqs
  end

  # return the highest frequency card value
  def highest_frequency_value
    # create a hash of the frequency of each card
    card_freqs = get_frequency

    # sort the hash by the frequency of each card and return the highest frequency card value
    card_freqs.sort_by { |v| card_freqs[card] }.last.get_integer
  end

  # determine if the hand contains a specific number of the same cards
  def card_frequency_calculator(num)
    # create a hash of the frequency of each card
    card_freqs = get_frequency

    # return true if the hand contains the specified number of the same cards
    card_freqs.values.any? {|num_of_same_cards| num_of_same_cards == num}
  end
end
