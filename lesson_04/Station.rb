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

  private

  #В интерфейсе не используется
  def trains_by_type(type)
    @trains.select { |train| train.type == type.type }
  end
end
