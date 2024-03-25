class Card

  # create getter methods for instance variables, suit and value
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

end
