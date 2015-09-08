class PassengerTrain < Train
  attr_accessor :train
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
    raise "Вы не можете присоединить грузовой вагон к пассажирскому поезду" if  wagon.type == "cargo" #проверка на тип вагона
    raise "Вы не можете присоединять вагон на ходу" unless @speed.zero?
  end

end