require_relative 'player'

class Game

  attr_accessor :players, :pot, :deck

  # constructor method that initializes the deck, players, and pot
  def initialize
    @deck = Deck.new
    @players = []
    @pot = 0
  end

  # create a play method to start and play the game until it is over
  def play
    # play rounds until the game is over
    play_round until game_over?
    game_over
  end

  # method that plays a round of poker
  def play_round
    # call the shuffle method on the deck
    deck.shuffle
    # unfold all players
    unfold_players
    # deal in the players
    deal_in
    # take bets
    take_bets
    # add option to end round or return if game is over (going to be added later)
    end_round && return if game_over?
    # trade cards
    trade_cards
    # take bets
    take_bets
    # end round
    end_round
  end
end
