class PassengerTrain < Train
  
  def  initialize( route = ["Москва","Владивосток"] )
    @speed = 0
    @route = route
    @station_index = 0
    @current_point = @route[0]
    @next_point = @route[1] 
    @previous_point 
    @train = {type: "passenger", wagons: 0}
  end

  def add_wagon(wagon)
    if @speed.zero? && wagon.type == "passenger"
    self.train[:wagons] += 1 
    elsif  wagon.type == "cargo"
    puts "Вы не можете присоединить грузовой вагон к пассажирскому поезду"
    else
    puts "Вы не можете присоединять вагон на ходу"
    end
  end

end