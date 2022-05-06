class Card
  attr_accessor :name, :suit, :weigth, :displayname

  def initialize(name, suit, weigth)
    @name = name
    @suit = suit
    @weigth = weigth
    @displayname = "#{name} #{suit}"
  end
end
