class Route
  # все методы public, так как являются интерфейсом класса. У клиентского кода должен быть к ним доступ.
  attr_reader :route
  
  def initialize(from, to)
  @route = [from, to]  
  end

  def add(station)
  self.route.insert(1,station)  
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
  puts self.route[1..-2] 
  end
end  