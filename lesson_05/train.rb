require_relative 'manufacturer.rb'
require_relative 'instance_counter.rb'

class Train
  include InstanceCounter
  include Manufacturer
  attr_accessor :speed
  attr_reader :number, :current_route, :vagons

  @@trains = []

  def self.find(number)
    result = @@trains.select { |train| train.number == number }
    result == [] ? nil : result
  end

  def initialize(number)
    @number = number
    @speed = 0
    @vagons = []
    @@trains.push(self)
    register_instance
  end

  def stop
    @speed = 0
  end

  def attach_vagon(vagon)
    if @speed.zero?
      @vagons.push(vagon)
    else
      puts 'Остановите поезд'
    end
  end

  def detach_vagon
    if @speed.zero?
      @vagons.pop
    else
      puts 'Остановите поезд'
    end
  end

  def add_route(route)
    @current_route = route
    @current_station = @current_route.list_of_stations[0]
    @current_station.attach_train(self)
  end

  def go_next
    @current_station.detach_train(self)
    @current_station = next_station
    @current_station.attach_train(self)
  end

  def go_previous
    @current_station.detach_train(self)
    @current_station = previous_station
    @current_station.attach_train(self)
  end

  protected

  # Ненужны для интерфейса

  def previous_station
    index = @current_route.list_of_stations.index(@current_station) - 1
    @current_route.list_of_stations[index]
  end

  def next_station
    index = @current_route.list_of_stations.index(@current_station) + 1
    @current_route.list_of_stations[index]
  end
end
