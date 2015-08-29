class RailwayStation
  
  attr_reader :name

   def initialize(name)
    @name = name
    @train_list = Array.new
    end  

   # методы ниже public(по умолчанию). Под замок не убираем, потом что они являются частью интерфейса класса 
   # и могут вызываться клиентским кодом

  def accept(train)
    @train = train
    @train[:time_arrival] = Time.now  
    @train_list << @train 
  end 

  def send
    @train_list.shift
  end

  def terminal
    puts "Количество поездов на станции #{@name}: #{@train_list.size}"
    list_trains
  end

  def type
    puts "Грузовые составы на станции"
    cargo_list
    puts "Пассажирские поезда на станции"
    passenger_list
  end

  private # секция private: методы помещенные ниже не являются частьюинтерфейса класса. Доступ извне класса к ним закрыт.

  def list_trains
  @train_list.each_with_index do |train, index|
      puts "В очереди на отправление #{index+1}, #{train[:type]}, кол-во вагонов #{train[:wagons]}, время прибытия #{train[:time_arrival]}" 
    end
  end

  def cargo_list
    train_list.each_with_index do |train, index|
      puts "В очереди на отправление #{index+1}, #{train[:type]}, кол-во вагонов #{train[:wagons]}, время прибытия #{train[:time_arrival]}" if train[:type] == "cargo"
    end
  end

  def passenger_list
     train_list.each_with_index do |train, index|
      puts "В очереди на отправление #{index+1}, #{train[:type]}, кол-во вагонов #{train[:wagons]}, время прибытия #{train[:time_arrival]}" if train[:type] == "passenger"
    end
  end

end  