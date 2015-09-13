class User
  attr_accessor :hand
  attr_accessor :points
  attr_reader :name
  
  def initialize(name)
    @name = name
    @points = 0
    @hand = []
    @deck = Deck.new
  end
   
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
  end   

end
