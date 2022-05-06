class Card
  attr_accessor :name, :suit, :weigth, :displayname

  def initialize(name, suit, weigth)
    @name = name
    @suit = suit
    @weigth = weigth
    @displayname = "#{name} #{suit}"
  end

  def move_to_trash(location)
    location.delete(self)
  end

  def move_to_hand(gamester)
    gamester.hand << self
    deck.delete(self)
  end
end
