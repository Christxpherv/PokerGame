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

    it "returns the hands cards" do
      # store the player's current hand in a variable
      players_hand = player.hand
      # expect that calling return_cards method returns the cards from the player's hand
      expect(player.return_cards).to eq(players_hand.cards)
    end
  end

  describe "receive_winnings" do
    it "adds amount won to players bankroll" do
      # call the receive_winnings method on the player
      player.receive_winnings
      # expect the player's bankroll to be 500
      expect(player.bankroll).to eq(500)
    end
  end

  describe "#place_bet" do
    it "prompts user for valid bet choice" do
      # stubbing the gets method to simulate user input.
      allow(player).to receive(:gets).and_return("f\n")
      # method should output a prompt asking for bet choice.
      expect { player.place_bet }.to output(/Would you like to \(f\)old, \(s\)ee, or \(r\)aise?/).to_stdout
    end
  end

  describe "#raise" do
    it "allows player to raise bet" do
      # stubbing the gets method to simulate user input.
      allow(player).to receive(:gets).and_return("50\n")
      # method should return the amount by which the player wants to raise.
      expect(player.raise).to eq(50)
    end
  end

  describe "#discard" do
    it "prompts the user for cards to discard and removes them from the hand" do
      # create a double for the hand
      hand = double("hand")
      # stub the cards method to return an array of cards
      allow(hand).to receive(:cards).and_return([1, 2, 3, 4, 5])
      # assign the hand to the player
      player.hand = hand

      # stub the gets method to simulate user input
      allow(player).to receive(:gets).and_return("1,3,5\\n")

      # call the discard method
      player.discard

      # expect the cards method to have been called on the hand
      expect(hand).to have_received(:cards).exactly(3).times

      # expect the cards in the hand to be [2, 4] after discarding
      expect(player.hand.cards).to eq([2, 4])
    end
  end
end
