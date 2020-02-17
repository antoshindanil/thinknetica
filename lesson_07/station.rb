require_relative 'instance_counter.rb'
require_relative 'validation.rb'

class Station
  include InstanceCounter
  include Validation

  attr_reader :name, :trains

  validate :name, :presence
  validate :name, :type, String
  validate :name, :format, /[\d\w]+/

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

  def trains_by_type(type)
    @trains.select { |train| train.type == type.type }
  end
end
