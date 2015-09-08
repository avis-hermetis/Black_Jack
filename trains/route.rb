class Route

  attr_reader :route
  
  def initialize(from, to)
  @from = from
  @to = to
  @route = [@from.name, @to.name]
  rescue NoMethodError  
  validate!
  end

  def add(station)
  self.route.insert(1,station.name) 
  raise "Вы пытаетесь добавить объект, который не является станцией" unless station.class == RailwayStation
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

  private

  def validate! #проверка на то, является ли станция, которую мы добавляем объектом RailwayStation
    raise "Отправная станция не является объектом класса RailwayStation" if @from.class != RailwayStation
    raise "Конечная станция не является объектом класса RailwayStation" unless @to.class == RailwayStation
    true
  end
end  