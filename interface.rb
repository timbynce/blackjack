class Game
  MENU = "Choose action:
  1 - Add card
  2 - Place a bet
  3 - Skip turn
  4 - Open cards"

  def initialize
    $deck = Deck.new
    @player = Gamester.new("Tim")
    @dealer = Dealer.new("Sam")
  end

  def new_round
    options = {
      '1' => proc {add_card}, '2' => proc {place_a_bet},
      '3' => proc {skip_turn}, '4' => proc {open_hands}
  }

    loop do
      puts "Your bank: #{@player.bank.to_s}"
      puts "Dealer bank: #{@dealer.bank.to_s}"
      new_dealing(@player)
      new_dealing(@dealer)

      loop do
        puts @player.show_hand
        puts @dealer.show_hand
        puts MENU
        choice = gets.chomp
        if @player.hand.size == 3 || @dealer.hand.size == 3
          choice = "4"
          options[choice].call
        else
          options[choice].call
          @dealer.make_choise
        end
        
        break unless choice != '4'
      end
        puts "Do you want to repeat?"
        choice = gets.chomp
        break if choice == "no" || @player.bank == 0 || @dealer.bank == 0
    
    end
  end

  def new_dealing(gamester)
    gamester.erase_hand
    gamester.add_cards(2)
    gamester.take_a_bet
  end

  def add_card
    @player.add_cards
  end

  def skip_turn
    @player.skip_turn
  end

  def open_hands
    puts @player.name + ' ' + @player.score.to_s + ' : ' + @dealer.score.to_s + ' ' + @dealer.name
    if @player.score > @dealer.score 
      @player.bank += 20
    elsif @player.score == @dealer.score
      @player.bank += 10
      @dealer.bank += 10
    else 
      @dealer.bank += 20
    end
  end

end