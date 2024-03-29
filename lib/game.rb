# working here
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
    # shuffle the deck
    deck.shuffle
    # unfold all players
    unfold_players
    # deal in the players
    deal_in
    # take bets
    take_bets
    # add option to end round or return if game is over
    end_round && return if game_over?
    # trade cards
    trade_cards
    # take bets
    take_bets
    # determine the winner
    winner = determine_winner
    # end the round and announce the winner of the round
    end_round(winner)
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
        raise_amount = player.raiseBet
        # add the raise amount to the high bet
        high_bet += raise_amount
        # add the raise amount to the pot
        add_to_pot(raise_amount)
      end
      return if game_over?
    end
  end


  def determine_winner
    # sort the players by the rank of their hand
    sorted_players = players.sort_by { |player| player.hand.rank }
    # set the winner to the player with the highest rank
    winner = sorted_players.last
    # if there is a tie in the rank, set the winner to the player with the highest frequency value
    if sorted_players.count { |player| player.hand.rank == winner.hand.rank } > 1
      # select the players with the highest frequency value
      highest_card_winners = sorted_players.select { |player| player.hand.highest_frequency_value == winner.hand.highest_frequency_value }
      # set the winner to the player with the highest card value
      winner = highest_card_winners.last
    end
    # show the hands of the players
    show_hands
    # announce the winner
    winner
  end

  def end_round(winner)
    # print the winner
    puts "\nWinner!"
    puts "#{winner.hand} (#{winner.hand.rank} points) wins $#{pot}!\n"
    # call the receive_winnings method on the winner and pass in the pot
    winner.receive_winnings(pot)
    # reset the pot to zero
    self.pot = 0
  end

  def show_hands
    puts "\nPlayers Hands"
    # iterate through each player in the game
    players.each_with_index do |player, i|
      # if the player has folded, skip to the next player
      next if player.folded?
      # print the player number and the players hand alogns with the rank of the hand
      puts "Player #{i + 1}: #{player.hand} (#{player.hand.rank} points)"
    end
  end

  def trade_cards
    # iterate through each player in the game
    players.each_with_index do |player, i|
      # if the player has folded, skip to the next player
      next if player.folded?
      puts "Player #{i + 1}:"
      puts player.hand.cards
      # call the discard method on the player and store the discarded cards in discarded_cards
      discarded_cards = player.discard
      # call the deal method on the deck and pass in the count of the discarded cards
      new_cards = deck.deal(discarded_cards.count)
      # replace the discarded cards with the new cards
      player.hand.replace_cards(discarded_cards, new_cards)
    end
  end

  def unfold_players
    # iterate through each player in the game and call the unfold method
    players.each(&:unfold)
  end

  def add_players(num, bankroll)
    # iterate num times and add a new player to the players array
    num.times { players << Player.new(bankroll, self.pot) }
  end

  def add_to_pot(amt)
    # add the amount to the pot
    self.pot += amt
  end

  def game_over?
    # set elgible players to zero
    elgible_players = 0
    # iterate through each player in the game and increment elgible players if the player has a bankroll greater than zero
    players.each { |player| elgible_players += 1 unless player.bankroll == 0}
    elgible_players < 2
  end
end
