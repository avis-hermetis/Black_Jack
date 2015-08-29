class Train
  
  
  # Все методы public, так как все- интерфейс класса. Доступны извне класса и для подклассов. 
  # protected нет, так как нет методов, к которым бы нужно было перекрывать доступ клиентскому коду
   
   attr_accessor :train
   
    def initialize
    @speed = 0
    @type = "cargo"
    @route = ["Москва", "Владивосток"]
    @station_index = 0
    @current_point = @route[0]
    @next_point = @route[1] 
    @previous_point 
    @train = {type: @type, wagons: 0}
    end
  
  def set_route(route) 
    @route = route
    @station_index = 0
    @current_point = @route[0]
    @next_point = @route[1] 
  end

  def add_wagon
    self.train[:wagons] += 1 if @speed.zero?
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
  
end  