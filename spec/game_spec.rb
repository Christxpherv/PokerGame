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
end
