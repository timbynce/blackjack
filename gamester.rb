# frozen_string_literal: true

class Gamester
  include Validation

  attr_accessor :bank
  attr_reader :name, :hand, :score, :next_move

  validate :name, :presence
  validate :name, :type, String
  validate :name, :format, /^[a-zA-Z]+$/
  validate :bank, :presence

  def initialize(name)
    @name = name
    @bank = 100
    @score = 0
    @hand = []

    validate!
  end

  def add_cards(number = 1, deck = Game.deck)
    deck.select_cards(number).each do |card|
      check_aces(card)
      deck.move_to_hand(self, card)
      update_score
    end
  end

  def show_hand
    current_status = "#{@name}: "
    @hand.each { |card| current_status = "#{current_status} #{card.displayname} " }
    "#{current_status} Score: #{@score}"
  end

  def take_a_bet
    validate!

    @bank -= 10
  end

  def skip_turn
    puts "#{@name}: Ok, i decide to skip this turn"
  end

  def erase_hand
    @hand = []
    @score = 0
  end

  private

  def update_score
    @score = @hand.map(&:weigth).inject(0, &:+)
  end

  def check_aces(card)
    card.weigth = 1 if card.name == 'Ace' && @score > 10
  end
end
