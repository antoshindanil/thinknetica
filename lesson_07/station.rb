# frozen_string_literal: true

require_relative 'instance_counter.rb'
require_relative 'validatable.rb'

class Station
  include InstanceCounter
  include Validatable
  attr_reader :name, :trains
  @@all_instances = []

  def self.all
    @@all_instances
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all_instances.push(self)
    register_instance
    validate!
  end

  def attach_train(train)
    @trains << train
  end

  def detach_train(train)
    @trains.delete(train)
  end

  def each_train
    @trains.each { |train| yield(train) }
  end

  private

  def validate!
    raise 'Вы не указали название станции' if @name.nil?
    raise 'Название станции меньше 2 символов' if @name.length < 2
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type.type }
  end
end
