# main.rb
require_relative 'game'

# Create a new instance of the Game class
game = Game.new

# Add players to the game
puts "How many players are playing?"
num_players = gets.chomp.to_i
puts "What is the starting bankroll for each player?"
starting_bankroll = gets.chomp.to_i

game.add_players(num_players, starting_bankroll)

# Play the game
game.play
