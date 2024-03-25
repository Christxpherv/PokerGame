class Card

  # create constant hash for symbols, string values, and integer values
  SYMBOLS = {:Clubs => "♣", :Diamonds => "♦", :Hearts => "♥", :Spades => "♠" }

  STRINGS = {
    :Two => "2", :Three => "3", :Four  => "4", :Five  => "5", :Six   => "6",
    :Seven => "7", :Eight => "8", :Nine  => "9", :Ten   => "10", :Jack  => "J",
    :Queen => "Q", :King  => "K", :Ace   => "A"
  }

  VALUES = {
    :Two => 2, :Three => 3, :Four  => 4, :Five  => 5, :Six   => 6,
    :Seven => 7, :Eight => 8, :Nine  => 9, :Ten   => 10,
    :Jack  => 11, :Queen => 12, :King  => 13, :Ace   => 14
  }

  # create getter methods for instance variables, suit and value
  attr_reader :suit, :value

  def initialize(suit, value)
    # raise an error if the suit or value is invalid
    unless Card.suits.include?(suit) and Card.values.include?(value)
      raise "invalid card, please verify the suit and value."
    end

    @suit = suit
    @value = value
  end

  # return an array of all the suits to be used in the init method to check if the suit is valid
  def self.suits
    SYMBOLS.keys
  end

  # return an array of all the values to be used in the init method to check if the value is valid
  def self.values
    STRINGS.keys
  end

  # create a getter method to return the string value of the card inside the STRINGS hash
  def get_value
    STRINGS[value]
  end

  # create a getter method to return the string suit of the card inside the SYMBOLS hash
  def get_suit
    SYMBOLS[suit]
  end

  # create a getter method to return the integer value of the card inside the VALUES hash
  def get_integer
    VALUES[value]
  end

  # return the string representation of the card
  def to_s
    # use value and suit as keys to get the string representation of the card
    "#{STRINGS[value]} of #{SYMBOLS[suit]}"
  end
end
