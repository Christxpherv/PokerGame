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


end
