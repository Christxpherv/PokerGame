require 'player'

describe Player do
  # create a player instance with a bankroll of 400 and a pot of 100
  subject(:player) { Player.new(400, 100)}

  describe "#fold" do
    it "should set the player to folded" do
      # call the fold method on the player
      player.fold
      # expect the player to be folded; predicate matcher expects boolean attribute to be true
      expect(player).to be_folded
    end
  end
end
