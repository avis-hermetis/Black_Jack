module PointsCount

  def points_count
    @points = 0
    count = []
    @hand.each {|card| count << @deck.cards[card]}
    count.sort!
    count.each do |value| 
      if @points > 10 && value == 11
        @points += 1
        else
        @points += value  
      end
    end  
    return @points
  end   

  def takes_card(deck)
    @hand.push( deck.deck[0] )
    deck.deck.shift
  end
  
end