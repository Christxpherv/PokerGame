require 'game'

describe Game do
  # create a new instance of the Game class
  subject(:game) { Game.new }

  describe "#add_players" do
    it "should add specified number of players" do
      # add players to the game and specify the bankroll
      game.add_players(2, 100)

      # expect the number of players to be 2
      expect(game.players.count).to eq(2)
    end

    it "should give each player the specified bankroll" do
      game.add_players(2, 100)

      # expect all players to have a bankroll of 100
      expect(game.players.all? {|player| player.bankroll == 100} ).to be true
    end
  end

  describe "#game_over?" do
    it "should return false when players have money" do
      game.add_players(5, 100)
      # if players have money, the game should not be over
      expect(game).to_not be_game_over
    end

    it "should return true when one or less players have money" do
      # create a game with 3 players, 2 of which have no money
      game.players = [ double("player1", :bankroll => 100),
                       double("player2", :bankroll =>   0),
                       double("player3", :bankroll =>   0) ]

      # the game should be over
      expect(game).to be_game_over
    end
  end

  describe "#deal_in" do
    # before each test in this block, add 5 players with a bankroll of 100 each
    before(:each) do
      game.add_players(5, 100)
    end

    it "should give each player a hand of cards" do
      # deal in the players
      game.deal_in
      # expect all players to have a hand
      expect( game.players.all? { |player| player.hand } ).to be true
    end

    it "should give each player 5 cards" do
      game.deal_in
      # expect all players to have 5 cards in their hand
      expect( game.players.all? { |player| player.hand.cards.count == 5 } ).to be true
    end

    it "should not give a hand to players with no money" do
      # add a player with no money
      game.add_players(1, 0)
      # deal in the player
      game.deal_in
      # expect the player to have no hand
      expect( game.players.last.hand.cards ).to eq([])
    end
  end

  describe "#add_to_pot" do
    it "increases pot by amount given" do
      # call the add_to_pot method with an argument of 100
      game.add_to_pot(100)
      # expect the pot to be 100
      expect(game.pot).to eq(100)
    end

    it "should change each players pot reference amount" do
      game.add_to_pot(100)
      # expect all players to have a pot of 100
      expect(game.players.all? {|player| player.pot == 100}).to be true
    end

    it "should return the amount added to the pot" do
      # expect the return value of add_to_pot to be 100
      expect(game.add_to_pot(100)).to eq(100)
    end
  end
end
