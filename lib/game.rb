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
    deck.shuffle!
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

  def deal_in
    # iterate through each player in the game and check if their bakroll is zero
    players.each { |player| player.bankroll == 0 ? player.fold : player.hand.deal_hand(deck) } # if player has no money, fold, otherwise deal hand
  end

  def take_bets
    # set high_bet to zero
    high_bet = 0
    # iterate through each player in the game
    players.each_with_index do |player, i|
      # if the player has folded, skip to the next player
      next if player.folded?
      # print the high bet
      puts "High bet: $#{high_bet}"
      # print the player number
      puts "Player #{i + 1}:"
      # print the players hand
      puts player.hand.cards
      # call the place_bet method on the player and store the response in player_response
      player_response = player.place_bet
      case player_response
      # if the player response is "f", fold the player
      when "f"
        player.fold
      # if the player response is "s", call the see method on the player
      when "s"
        player.see(high_bet)
      # if the player response is "r", call the raise method on the player
      when "r"
        player_response = player.raiseBet
        # set high_bet to the player_response
        high_bet = player_response
      end
      # end the round and return if the game is over
      return if game_over?
    end
  end
end
