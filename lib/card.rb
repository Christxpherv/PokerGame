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
    @suit = suit
    @value = value
  end

end
