class Route
  attr_reader :route
  
  def initialize(from, to)
  @route = [from, to]  
  end

  def add(station)
  self.route.insert(1,station)  #исправил
  end

  def remove(station)
    if self.route.delete(station) == "not found" 
      puts "Такой станции нет списке"
    end
  end

  def list
  puts "Маршрут: #{@route.first} - #{@route.last}" 
    self.route.each { |station|puts station}
    end

  def intermed_stations
  puts self.route[1..-2] #исправил
  end
end  


class Train
  attr_reader :train
  attr_reader :route

   def initialize(type = "passenger", route)
    @speed = 0
    @type = type
    @route = route
    @station_index = 0
    @current_point = @route[0]
    @next_point = @route[1] 
    @previous_point 
    @train = {type: @type, wagons: 0}
  end

    def set_route(route)  #не проверен до конца
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

  def notice #неполная инфа
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

class RailwayStation
  attr_reader :train

  def initialize(name)
    @name = name
    @train_list = Array.new
    end  

  def accept(train)
    self.train = train
    self.train[:time_arrival] = Time.now  
    @train_list << self.train 
  end 

  def send
    @train_list.shift
  end

  def terminal
    puts "Количество поездов на станции #{@name}: #{@train_list.size}"
    @train_list.each_with_index do |train, index|
      puts "В очереди на отправление #{index+1}, #{train[:type]}, кол-во вагонов #{train[:wagons]}, время прибытия #{train[:time_arrival]}"
    end
  end

  def cargo
    puts "Грузовые составы на станции"
    @train_list.each_with_index do |train, index| 
    puts "В очереди на отправление #{index}, кол-во вагонов #{train[:wagons]}, время прибытия #{train[:time_arrival]}" if train[:type] == "cargo"
    end
  end

  def passenger
    puts "Пассажирские поезда на станции"
    @train_list.each_with_index do |train, index| 
    puts "В очереди на отправление #{index}, кол-во вагонов #{train[:wagons]}, время прибытия #{train[:time_arrival]}" if train[:type] == "passenger"
    end
  end

end  