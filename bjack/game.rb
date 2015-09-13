class Game
  def initialize
    puts "Добрый день, игрок!"
    puts "Как ваше имя?"
    @user = User.new(gets.chomp.capitalize)
    @user_money = 100
    @dealer_money = 100
  end
  
  def start
   
    puts "Начнем, #{@user.name}."
    puts "Диллер раздает карты..."
    @deck = Deck.new
    @dealer = Dealer.new
    @dealer.open(@deck)
    @dealer.deals
    @user.hand = @dealer.user_hand
    puts "Диллер выкладывает свои карты на стол рубашкой вверх."
     @dealer.dealer_hand.size.times {print "* "}
    puts ""
    puts "Ваш ход"
    puts @user.hand
    @user.points_count
    @dealer.points_count
    puts "1  Пропустить ход"
    puts "2  Добавить карту"
    puts "3  Открыть карты"
    case line = gets.chomp.to_i
      when 1
        puts "Вы пропускаете ход."
        puts "Ход диллера..."
        @dealer.move
        showdown
        
        puts " Деньги игрока: #{@user_money}"
        puts " Деньги диллера: #{@dealer_money}"
        
    
      when 2
        puts "Вы берете карту."
        @dealer.card_to_user
        @user.hand = @dealer.user_hand
        @user.points_count
        puts "Ход диллера..."
        @dealer.move
        showdown
        

      when 3
        showdown
    end
  end

    def showdown
      puts "Вскрываемся!"
      puts "Карты диллера: #{@dealer.dealer_hand}"
      puts "Ваши карты: #{@user.hand}"
      if @user.points > 21 
        puts "Очки диллера: #{@dealer.points}"
        puts "Ваши очки: #{@user.points}"
        puts "Вы проиграли!"
        @user_money = @user_money - 10
        @dealer_money = @dealer_money + 10
      elsif @user.points <= 21 && @user.points == @dealer.points
        puts "Очки диллера: #{@dealer.points}"
        puts "Ваши очки: #{@user.points}"
        puts "Ничья!"
      elsif @user.points <= 21 && @dealer.points > 21
        puts "Очки диллера: #{@dealer.points}"
        puts "Ваши очки: #{@user.points}"
        puts "Поздравляю, вы победили!"
         @user_money = @user_money + 10
        @dealer_money = @dealer_money - 10
      elsif @user.points <= 21 && @dealer.points <= 21 &&  @user.points > @dealer.points
        puts "Очки диллера: #{@dealer.points}"
        puts "Ваши очки: #{@user.points}"
        puts "Поздравляю, вы победили!"
         @user_money = @user_money + 10
        @dealer_money = @dealer_money - 10
      else
        puts "Очки диллера: #{@dealer.points}"
        puts "Ваши очки: #{@user.points}"
        puts "Вы проиграли!"
         @user_money = @user_money - 10
        @dealer_money = @dealer_money + 10
      end

       puts " Деньги игрока: #{@user_money}"
       puts " Деньги диллера: #{@dealer_money}"
    end 

end