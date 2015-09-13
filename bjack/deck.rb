class Deck
  attr_accessor :deck 
  attr_reader :cards
  #конструктор: задаем хэш со всеми картами колоды
  def initialize
    @cards = {'2<>'=> 2, '3<>' => 3, '4<>' => 4, '5<>' => 5, '6<>' => 6, '7<>' => 7, '8<>' => 8, '9<>' => 9, '10<>' => 10, 'J<>' => 10, 
            'L<>' => 10, 'K<>' => 10, 'A<>' => 11, '2+'=> 2, '3+' => 3, '4+' => 4, '5+' => 5, '6+' => 6, '7+' => 7, '8+' => 8, '9+' => 9, 
            '10+' => 10, 'J+' => 10,'L+' => 10, 'K+' => 10, 'A+' => 11, '2<3'=> 2, '3<3' => 3, '4<3' => 4, '5<3' => 5, '6<3' => 6, '7<3' => 7, 
            '8<3' => 8, '9<3' => 9, '10<3' => 10, 'J<3' => 10, 'L<3' => 10, 'K<3' => 10, 'A<3' => 11, '2^'=> 2, '3^' => 3, '4^' => 4, 
            '5^' => 5, '6^' => 6, '7^' => 7, '8^' => 8, '9^' => 9, '10^' => 10, 'J^' => 10,'L^' => 10, 'K^' => 10, 'A^' => 11}  
 shuffle                  
  end
   
  
  def shuffle
   self.deck = @cards.keys
   shuffled_deck = Array.new
    while self.deck.size > 0 do
     shuffled_deck << self.deck[rand(self.deck.size)] # генерирует массив ключей
     self.deck.delete(shuffled_deck.last)
    end
    self.deck = shuffled_deck
  end  
  #аттрибут доступа к колоде
end