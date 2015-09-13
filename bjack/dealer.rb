class Dealer
    attr_accessor :dealer_hand
    attr_accessor :user_hand
    attr_reader :points
   attr_accessor :money
   attr_accessor :bank

  def initialize
    @points = 0
    @dealer_hand = Array.new
    @user_hand = Array.new
  end
  
  def open(new_deck)
    @new_deck = new_deck
  end
  
  def deals
      2.times do
        card_to_dealer
        card_to_user
      end
  end

  
 def move
  points_count
  if @points < 18
    card_to_dealer
    points_count
    return @points
  elsif @points == 22
    card_to_dealer
    points_count
    return @points
  else
    return @points
  end
 end 
  
  def points_count
    @points = 0
    count = []
    @dealer_hand.each {|card| count << @new_deck.cards[card]}
    count.sort!
    count.each do |value| 
      if @points > 10 && value == 11
        @points += 1
        else
        @points += value  
      end
    end  
  end   

  def card_to_dealer
    @dealer_hand.push( @new_deck.deck[0] )
    @new_deck.deck.shift
  end

  def card_to_user
    @user_hand.push( @new_deck.deck[0] )
    @new_deck.deck.shift
  end

end