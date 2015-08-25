class Route
  def initialize(from, to)
  @route = [from, to]  
  end

  def add(station)
  @route[1, 0] = [station] #добавляет именно промежуточные станции
  end

  def remove(station)
    if @route.delete(station) == "not found" 
      puts "Такой станции нет списке"
    end
  end

  def list
   puts "Маршрут: #{@route.first} - #{@route.last}}" 
   @route.each { |station|puts station}
  end

  def intermed_stations
  puts @route[1...@route.size-1] #выводит промежуточные станции
  end
end  


class Train
  def initialize(type = "passenger", route = ["Владивосток", "Москва"], wagons = 0)
    @type = type
    @route = route
    @wagon = 0
    @station_i = 0
    @current_point = @route[0]
    @next_point = @route[1] 
    @previous_point
  end

  def set_route(list)
    @route = list
    @station_i = 0
    @current_point = @route[0]
  end

  def add_wagon
    @wagons += 1 if @speed.zero?
  end

  def remove_wagon
    @wagons -= 1 if @speed.zero? && @wagons > 0
  end

  def wagons
   puts "Количество вагонов #{@wagons}" 
  end

  def speed
    puts "Текущая скорость #{speed}"
  end

  def accelerate
    puts "Повышаем скорость на 40 км/ч"
    @speed += 40
  end

  def retard
    puts "Снижаем скорость на 40 км/ч"
    @speed -= 40 
    @speed = 0 if @speed <= 40
  end

  def departure
    if @station_index < @route.size - 1
      puts "Поезд отправляется со станции #{@route[@station_index]}, следующая станция #{@route[@station_index + 1]}"
      @speed += 20
    else
      puts "Поезд прибыл на конечную станцию #{@route[@station_index]}"
    end
  end

  def arrive
   puts "Поезд прибыл на станцию #{@route[@station_index + 1]}" 
   @speed = 0  
   @station_index += 1 until @station_index = @route.size - 1
  end

  def notice
    case @speed 
      when 0
        puts "Поезд стоит на станции #{@route[@station_index]}"
      else
        puts "Поезд движется со скоростью #{@speed}"
    end
    
    puts "Предыдущая станция #{@route[@station_index - 1]}" if @station_index > 0
    puts "Следующая станция #{@route[@station_index + 1]}" until @station_index = @route.size - 1
  end
  
end  

class RailwayStation
  def initialize(name)
    @name = name
    @train_list = Array.new
    end  

  def accept(type, number_of_wagons)
    @train_list << {type: type, wagons: number_of_wagons, time_arrival: Time.new}
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