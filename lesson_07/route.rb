# frozen_string_literal: true

require_relative 'instance_counter.rb'
require_relative 'validatable.rb'

class Route
  include InstanceCounter
  include Validatable
  attr_reader :list_of_stations

  def initialize(start_point, end_point)
    @start_point = start_point
    @end_point = end_point
    @list_of_stations = [@start_point, @end_point]
    register_instance
    validate!
  end

  def add(station)
    @list_of_stations.insert(-2, station)
  end

  def delete(station)
    @list_of_stations.delete(station)
  end

  private

  def validate!
    if @start_point.nil?
      raise ArgumentError, 'Введите название начальной станции'
    end
    raise ArgumentError, 'Введите название конечной станции' if @end_point.nil?
  end
end
