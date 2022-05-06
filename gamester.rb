class Gamester
  attr_accessor :name, :hand, :bank, :score

  def initialize(name)
    @name = name
    @bank = 100
    @score = 0
    @hand = []
  end

  def add_card(deck)
    deck.select_cards(1).each{ |card| hand << card}
    update_score
  end

  def update_score
    @score = hand.map(&:weigth).inject(0, &:+)
  end
end