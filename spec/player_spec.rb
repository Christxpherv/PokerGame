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

  describe "unfold" do
    it "should unfold a folded player" do
      # fold the player first
      player.fold
      # call the unfold method on the player
      player.unfold
      # predicate matcher expects boolean attribute to be false
      expect(player).to_not be_folded
    end
  end
end
