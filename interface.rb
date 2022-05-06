# frozen_string_literal: true

class Game
  include Validation

  MENU = "Choose action:
  1 - Add card
  2 - Skip turn
  3 - Open cards"

  def initialize
    new_player
    @dealer = Dealer.new('Sam')
  end

  def new_game
    loop do
      self.class.new_deck
      puts "Your bank: #{@player.bank}; Dealer bank: #{@dealer.bank}"
      new_dealing(@player)
      new_dealing(@dealer)

      new_round

      puts 'Do you want to repeat?'
      choice = gets.chomp
      break if choice == 'no'
    end
  end

  def self.deck
    @@deck
  end

  def self.new_deck
    @@deck = Deck.new
  end

  private

  def new_round
    options = { '1' => proc { add_card }, '2' => proc { skip_turn }, '3' => proc { take_winner } }

    loop do
      show_hand(@player)
      puts MENU
      choice = gets.chomp

      if @player.hand.size == 3 || @dealer.hand.size == 3 || choice == '3'
        puts 'Time to open your cards!'
        show_hand(@player, @dealer)
        options['3'].call
        break
      else
        options[choice].call
        @dealer.make_choice
      end
    end
  end

  def new_player
    puts 'Tell me your name!'
    name = gets.chomp
    @player = Gamester.new(name)
  rescue StandardError => e
    puts e.message
    retry
  end

  def new_dealing(gamester)
    gamester.erase_hand
    gamester.add_cards(2)
    gamester.take_a_bet
  rescue StandardError => e
    puts e.message
    puts "Let's start new game!"
    new_game
  end

  def add_card
    @player.add_cards
  end

  def skip_turn
    @player.skip_turn
  end

  def take_winner
    puts "#{@player.name} #{@player.score} : #{@dealer.score} #{@dealer.name}"

    if (@player.score > @dealer.score || @dealer.score > 21) && @player.score <= 21
      win(@player)
    elsif (@player.score < @dealer.score || @player.score > 21) && @dealer.score <= 21
      win(@dealer)
    else
      draw
    end
  end

  def win(gamester)
    puts "#{gamester.name} win this game!"
    gamester.bank += 20
  end

  def show_hand(*gamesters)
    gamesters.each { |gamester| puts gamester.show_hand }
  end

  def draw
    puts 'Draw!'
    @player.bank += 10
    @dealer.bank += 10
  end
end
