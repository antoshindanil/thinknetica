require_relative 'vagon.rb'

class CargoVagon < Vagon
  attr_reader :value, :filled_value, :number

  def initialize(value)
    @value = value
    @filled_value = 0
    @number = rand(300)
  end

  def fill_value(value)
    @filled_value += value
  end

  def free_value
    value - filled_value
  end
end
