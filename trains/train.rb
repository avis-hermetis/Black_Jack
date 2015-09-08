   module Producer
    attr_accessor :producer
  end
  
   class Train
    include Producer
     
     @@number = {}
  

   def self.find(number)
     @@number[number]
     raise "Номер не соответствует формату" unless number =~ TRAIN_NUMBER
    end

  def initialize(number, type = "cargo", route = ["Москва", "Владивосток"])
    @number = number
    @speed = 0
    @type = type
    @route = route
    @station_index = 0
    @current_point = @route[0]
    @next_point = @route[1] 
    @previous_point 
    @train = {type: @type, wagons: 0}
    validate!
    @@number[@number]= self
    
  end

  def validate?
    validate!
  rescue
    false
  end
   
  def set_route(route) 
    @route = route
    @station_index = 0
    @current_point = @route[0]
    @next_point = @route[1] 
  end

  

  def remove_wagon
    self.train[:wagons] -= 1 if @speed.zero? && self.train[:wagons] > 0
  end

  def wagons
   puts "Количество вагонов #{self.train[:wagons]}" 
  end

  def speed
    puts "Текущая скорость #{@speed}" 
  end

  def accelerate
    puts "Повышаем скорость на 40 км/ч"
    @speed += 40
  end

  def retard
    puts "Снижаем скорость на 40 км/ч"
    if @speed >= 40 
      @speed -= 40 
    else
      @speed = 0
    end
  end

  def departure
    if @station_index < @route.size - 1     
      puts "Поезд отправляется со станции #{self.route[@station_index]}, следующая станция #{self.route[@station_index + 1]}"
      @speed += 20
    else
      puts "Поезд прибыл на конечную станцию #{self.route[@station_index]}"
    end
  end

  def arrive
   puts "Поезд прибыл на станцию #{self.route[@station_index + 1]}" 
   @speed = 0  
   @station_index += 1 if @station_index < @route.size - 1
  end

  def notice 
      case @speed 
      when 0
        puts "Поезд стоит на станции #{@route[@station_index]}"
      else
        puts "Поезд движется со скоростью #{@speed}"
      end
    
    puts "Предыдущая станция #{@route[@station_index - 1]}" if @station_index > 0
    puts "Следующая станция #{@route[@station_index + 1]}" if @station_index < @route.size - 1
  end

  private
 
 TRAIN_NUMBER = /^([a-z]|\d){3}\-{0,1}([a-z]|\d){2}$/ # проверка на формат:три буквы или цифры в любом порядке, 
 #необязательный дефис (может быть, а может нет) и еще 2 буквы или цифры после дефиса.  

 def validate!
  
  raise "Поезд с таким номером уже существует" if @@number[@number] #проверка на уникальность номера поезда
  raise "Номер не соответствует формату" unless @number =~ TRAIN_NUMBER
  raise "Вы не ввели номер" if @number.nil?
  true
  end

end 