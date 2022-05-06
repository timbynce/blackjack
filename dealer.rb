# frozen_string_literal: true

class Dealer < Gamester
  validate :name, :presence

  def make_choice
    @next_move = @score >= 17 ? 'skip_turn' : 'add_cards'
    send @next_move
  end
end
