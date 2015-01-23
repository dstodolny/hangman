require_relative '../lib/hangman.rb'

puts 'Welcome to hangman'
player = Hangman::Player.new('human')
Hangman::Game.new(player).run
