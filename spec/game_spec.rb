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
  end
end
