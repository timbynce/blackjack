class Dealer < Gamester

  def initialize(name)
    super(name)
  end

  def make_choise
    @next_move = @score > 17 ? "skip_turn" : "add_cards"
    send @next_move
  end
end