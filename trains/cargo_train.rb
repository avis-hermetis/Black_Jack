class CargoTrain < Train
  attr_reader :train
  def  initialize( route = ["Москва","Владивосток"] )
    @speed = 0
    @route = route
    @station_index = 0
    @current_point = @route[0]
    @next_point = @route[1] 
    @previous_point 
    @train = {type: "cargo", wagons: 0}
  end

  def add_wagon(wagon)
    if @speed.zero? && wagon.type == "cargo"
    self.train[:wagons] += 1 
    elsif  wagon.type == "passenger"
    puts "Вы не можете присоединить пассажирский вагон к грузовому составу"
    else
    puts "Вы не можете присоединять вагон на ходу"
    end
  end

end