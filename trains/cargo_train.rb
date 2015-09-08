class CargoTrain < Train
  attr_accessor:train
  def  initialize(number, route = ["Москва","Владивосток"] )
    @number = number
    @speed = 0
    @route = route
    @station_index = 0
    @current_point = @route[0]
    @next_point = @route[1] 
    @previous_point 
    @train = {type: "passenger", wagons: 0}
    validate!
    @@number[@number]= self
  end
 

  def add_wagon(wagon)
    self.train[:wagons] += 1 
    raise "Вы не можете присоединить пассажирский вагон к грузовому составу" if  wagon.type == "passenger" #проверка на тип вагона
    raise "Вы не можете присоединять вагон на ходу" unless @speed.zero?
  end
  
  private

  def validate!
    raise "Неверно задан маршрут!" unless route.class == Array || route[0].class == String || route[1].class == String 
    true
  end

end