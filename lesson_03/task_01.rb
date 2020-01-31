class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def attach_train(train)
    @trains << train
  end

  def detach_train(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end

end

class Route
  attr_reader :list_of_stations

  def initialize(start_point, end_point)
    @start_point = start_point
    @end_point = end_point
    @list_of_stations = [@start_point, @end_point]
  end

  def add(station)
    @list_of_stations.insert(-2, station)
  end

  def delete(station)
    @list_of_stations.delete(station)
  end

end

class Train
  attr_accessor :speed
  attr_reader :vagon_count, :current_station

  def initialize(number, type, vagon_count)
    @number = number
    @type = type
    @vagon_count = vagon_count
  end

  def stop
    @speed = 0
  end

  def attach_vagon
    if @speed.zero?
       @vagon_count += 1
    else
      puts 'Остановите поезд'
    end
  end

  def detach_vagon
    if @speed.zero?
      @vagon_count -= 1
    else
      puts 'Остановите поезд' 
    end
  end

  def add_route(route)
    @current_route = route
    @current_station = @current_route.list_of_stations[0]
    @current_station.attach_train(self)
  end

  def previous_station
    index = @current_route.list_of_stations.index(@current_station) - 1
    @current_route.list_of_stations[index]
  end

  def next_station
    index = @current_route.list_of_stations.index(@current_station) + 1
    @current_route.list_of_stations[index]
  end

  def go_next
    @current_station.detach_train(self)
    @current_station = self.next_station
    @current_station.attach_train(self)
  end

  def go_previous
    @current_station.detach_train(self)
    @current_station = self.previous_station
    @current_station.attach_train(self)
  end

end
