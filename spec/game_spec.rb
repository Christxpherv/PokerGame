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
end
