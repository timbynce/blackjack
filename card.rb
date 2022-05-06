# frozen_string_literal: true

class Card
  include Validation

  attr_reader :name, :suit, :displayname
  attr_accessor :weigth

  validate :name, :presence
  validate :suit, :presence
  validate :weigth, :presence

  def initialize(name, suit, weigth)
    @name = name
    @suit = suit
    @weigth = weigth
    @displayname = "#{name}-#{suit}"

    # validate!
  end
end
