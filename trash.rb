class Trash
  attr_reader :cards
  
  def initialize
    erase
  end

  def erase
    @cards = []
  end
end