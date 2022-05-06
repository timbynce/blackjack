require_relative "card"
require_relative "deck"
require_relative "gamester"

deck = Deck.new
player = Gamester.new("Tim")

player.add_card(deck)

player.hand.each{|c| puts c.displayname}
puts player.score