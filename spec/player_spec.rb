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

  describe "deal_in" do
    it "deals a player a hand of cards" do

     hand = double("hand")
      # call the deal_in method on the player using the hand double
     player.deal_in(hand)
    # expect that the player's hand is now set to the provided hand double
     expect(player.hand).to eq(hand)
    end
  end

  describe "return_cards" do
    it "sets players cards back to new hand" do
      # call the return_cards method on the player
      player.return_cards
      # expect the player's hand to be empty
      expect(player.hand.cards).to eq([])
    end
  end
end
