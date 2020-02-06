require_relative 'instance_counter.rb'

class Route
  include InstanceCounter
  attr_reader :list_of_stations

  def initialize(start_point, end_point)
    @start_point = start_point
    @end_point = end_point
    @list_of_stations = [@start_point, @end_point]
    register_instance
  end

  def add(station)
    @list_of_stations.insert(-2, station)
  end

  def delete(station)
    @list_of_stations.delete(station)
  end
end
