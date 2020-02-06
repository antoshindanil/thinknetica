require_relative 'instance_counter.rb'

class Station
  include InstanceCounter
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
  end

  def attach_train(train)
    @trains << train
  end

  def detach_train(train)
    @trains.delete(train)
  end

  private

  #В интерфейсе не используется
  def trains_by_type(type)
    @trains.select { |train| train.type == type.type }
  end
end
