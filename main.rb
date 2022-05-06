# frozen_string_literal: true
# проект игры blackjack

require_relative 'validation'
require_relative 'card'
require_relative 'deck'
require_relative 'gamester'
require_relative 'dealer'
require_relative 'interface'

game = Game.new
game.new_game
