require 'hand'

describe Hand do
  # create a new hand
  subject(:hand) { Hand.new }

  # create a bunch of mock hands that we will be using for testing the strength of a hand
  let(:two_of_h) { double("two_of_h", :get_integer => 2, :get_suit => :heart)}
  let(:two_of_d) { double("two_of_d", :get_integer => 2, :get_suit => :diamonds)}
  let(:two_of_c) { double("two_of_c", :get_integer => 2, :get_suit => :clubs)}
  let(:two_of_s) { double("two_of_s", :get_integer => 2, :get_suit => :spades)}
  let(:three_of_h) { double("three_of_h", :get_integer => 3, :get_suit => :heart)}
  let(:three_of_s) { double("three_of_s", :get_integer => 3, :get_suit => :spades)}
  let(:four_of_s) { double("four_of_s", :get_integer => 4, :get_suit => :spades)}
  let(:five_of_s) { double("five_of_s", :get_integer => 5, :get_suit => :spades)}
  let(:six_of_s) { double("six_of_s", :get_integer => 6, :get_suit => :spades)}
  let(:seven_of_s) { double("seven_of_s", :get_integer => 7, :get_suit => :spades)}

  # finish creating the mock hands
  let(:high_card) {[two_of_h, three_of_h, four_of_s, five_of_s, seven_of_s]}
  let(:pair) {[two_of_h, two_of_c, three_of_s, four_of_s, five_of_s]}
  let(:two_pair) {[two_of_h, two_of_d, three_of_h, three_of_s, seven_of_s]}
  let(:three_of_a_kind) {[two_of_h, two_of_d, two_of_c, three_of_h, four_of_s]}
  let(:four_of_a_kind) {[two_of_h, two_of_d, two_of_c, two_of_s, four_of_s]}
  let(:straight) {[three_of_h, four_of_s, five_of_s, six_of_s, seven_of_s]}
  let(:flush) {[two_of_s, four_of_s, five_of_s, six_of_s, seven_of_s]}
  let(:full_house) {[two_of_s, two_of_h, two_of_d, three_of_h, three_of_s]}
  let(:straight_flush) {[three_of_s, four_of_s, five_of_s, six_of_s, seven_of_s]}

  # add more hands for royal flush
  let(:royal_flush) { [ace_of_h, king_of_h, queen_of_h, jack_of_h, ten_of_h] }
  let(:ace_of_h) { double("ace_of_h", :get_integer => 14, :get_suit => :heart) }
  let(:king_of_h) { double("king_of_h", :get_integer => 13, :get_suit => :heart) }
  let(:queen_of_h) { double("queen_of_h", :get_integer => 12, :get_suit => :heart) }
  let(:jack_of_h) { double("jack_of_h", :get_integer => 11, :get_suit => :heart) }
  let(:ten_of_h) { double("ten_of_h", :get_integer => 10, :get_suit => :heart) }

  # add a method that deals a hand to the player
  describe "#deal_hand" do
    it "takes 5 cards from deck" do
      # create a mock deck
      deck = double("deck")
      # create a mock hand using the high card hand
      deck_cards = high_card

      # expect the deck to receive the deal method with 5 cards and return the deck cards
      deck.should_receive(:deal).with(5).and_return(deck_cards)
      # call the deal_hand method on the hand object
      hand.deal_hand(deck)
      # expect the hand to have the same cards as the deck
      hand.cards =~ deck_cards
    end
  end

  # create a rank method to test the strength of a hand
  describe "#rank" do
    it "returns 1 for a high card" do
      # assigns the high card hand as the current hand
      hand.cards = high_card
      # expect the rank of the hand to be one; simeltaenously testing the high_card? method
      expect(hand.rank).to eq(1)
    end

    it "returns 2 for a pair" do
      # assigns the pair hand as the current hand
      hand.cards = pair
      # expect the rank of the hand to be two; simeltaenously testing the pair? method
      expect(hand.rank).to eq(2)
    end

    it "returns 3 for two pair" do
      # assigns the two pair hand as the current hand
      hand.cards = two_pair
      # expect the rank of the hand to be three; simeltaenously testing the two_pair? method
      expect(hand.rank).to eq(3)
    end

    it "returns 4 for three of a kind" do
      # assigns the three of a kind hand as the current hand
      hand.cards = three_of_a_kind
      # expect the rank of the hand to be four; simeltaenously testing the three_of_a_kind? method
      expect(hand.rank).to eq(4)
    end

    it "returns 5 for a straight" do
      # assigns the straight hand as the current hand
      hand.cards = straight
      # expect the rank of the hand to be five; simeltaenously testing the straight? method
      expect(hand.rank).to eq(5)
    end

    it "returns 6 for a flush" do
      # assigns the flush hand as the current hand
      hand.cards = flush
      # expect the rank of the hand to be six; simeltaenously testing the flush? method
      expect(hand.rank).to eq(6)
    end

    it "returns 7 for a full house" do
      # assigns the full house hand as the current hand
      hand.cards = full_house
      # expect the rank of the hand to be seven; simeltaenously testing the full_house? method
      expect(hand.rank).to eq(7)
    end

    it "returns 8 for four of a kind" do
      # assigns the four of a kind hand as the current hand
      hand.cards = four_of_a_kind
      # expect the rank of the hand to be eight; simeltaenously testing the four_of_a_kind? method
      expect(hand.rank).to eq(8)
    end

    it "returns 9 for straight flush" do
      # assigns the straight flush hand as the current hand
      hand.cards = straight_flush
      # expect the rank of the hand to be nine; simeltaenously testing the straight_flush? method
      expect(hand.rank).to eq(9)
    end
    it "returns 10 for royal flush" do
      # assigns the royal flush hand as the current hand
      hand.cards = royal_flush
      # expect the rank of the hand to be ten; simeltaenously testing the royal_flush? method
      expect(hand.rank).to eq(10)
    end
  end

  # now that we have the rank of the cards, we can compare the strength of the hands
  describe "#beats?" do
    it "returns true if hand value stronger than opposing hand" do
      # create a mock hand
      hand2 = double("hand2")

      # expect the rank of the hand to be 4
      allow(hand).to receive(:rank).and_return(4)
      # expect the rank of the hand2 to be 3
      allow(hand2).to receive(:rank).and_return(3)

      # expect the hand to beat the hand2
      expect(hand.beats?(hand2)).to be_truthy
    end

    it "returns true if same hand value but higher cards" do

      # set the cards for the hand and hand2
      hand2 = double("hand2", :cards => pair)
      hand.cards = [three_of_h, three_of_s, four_of_s, five_of_s, six_of_s]

      # if the cards have an equal rank, the hand with the higher frequency value should win
      hand.should_receive(:rank).and_return(2)
      hand2.should_receive(:rank).and_return(2)

      # calculate the highest frequency value
      hand.should_receive(:highest_frequency_value).and_return(3)
      hand2.should_receive(:highest_frequency_value).and_return(2)

      # expect the hand to beat the hand2
      expect(hand.beats?(hand2)).to be_truthy
    end
  end
  # create a method that will replace the cards in the hand
  describe "#replace_cards" do
    it "takes cards from hand and replaces with new cards from deck" do
      # create a mock deck
      deck = double("deck")
      hand.cards = pair

      # create old cards and new cards
      old_cards = [hand.cards[2], hand.cards[3], hand.cards[4]]
      new_cards = [two_of_d, two_of_s, five_of_s]
      # expect the deck to receive the take method with 3 cards and return the new cards
      allow(deck).to receive(:take).with(3).and_return(new_cards)
      # call the replace_cards method on the hand object
      hand.replace_cards(old_cards, new_cards)

      # new hand should be the first two cards in the hand and the new cards
      new_hand = [hand.cards[0], hand.cards[1]].concat(new_cards)

      # expect the hand to have the new hand
      expect(hand.cards).to eq(new_hand)
    end
  end
end
