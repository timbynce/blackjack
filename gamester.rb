class Gamester
  attr_accessor :name, :hand, :bank, :score, :next_move

  def initialize(name)
    @name = name
    @bank = 100
    @score = 0
    @hand = []
  end

  def add_cards(number = 1, deck = $deck)    
    deck.select_cards(number).each do |card| 
      deck.move_to_hand(self, card)
      update_score
    end
  end

  def skip_turn
     "#{@name}: Ok, i decide to skip this turn"
  end

  def erase_hand
    self.hand = []
  end

  def show_hand
    current_status = "Hand: "
    self.hand.each{|card| current_status = current_status + card.displayname + ' ; '}
    current_status = current_status + "Score: " + self.score.to_s
    current_status
  end

  def take_a_bet
    self.bank -=10
  end

  private

  def update_score
    @score = hand.map(&:weigth).inject(0, &:+)
  end
end