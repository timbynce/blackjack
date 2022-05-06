class Deck
  attr_accessor :cards

  CARD_NAMES = {
    "2" => 2, "3" => 3, "4" => 4, "5" => 5, 
    "6" => 6, "7" => 7, "8" => 8, "9" => 9, 
    "10" => 10, "Jack" => 10, "Queen" => 10, 
    "King" => 10, "Ace" => 11
  }
  CARD_SUITS = ["♠", "♥", "♦", "♣"]

  def initialize
    create_deck
  end

  def create_deck
    @cards = []
    card_names = CARD_NAMES
    card_suits = CARD_SUITS

    card_suits.each do |suit|
      card_names.each do |name, weigth|
      @cards << Card.new(name,suit, weigth)        
      end
    end
  end

  def select_cards(number)
    cards.sample(number)
  end

# временный метод для себя
  def print_deck
    cards.each do |card|
      puts card.displayname
      puts "----------"
    end

  end
end