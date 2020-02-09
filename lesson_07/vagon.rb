require_relative 'manufacturer.rb'

class Vagon
  include Manufacturer
  attr_reader :value, :number, :filled

  def initialize(value)
    @value = value
    @filled = 0
    @number = rand(300)
  end

  def fill(value)
    if (value + @filled) < @value
      @filled += value
    else
      raise ArgumentError, "Вы пытаетесь занять #{value} объема, а всего у вагона #{@value}"
    end
  end

  def free_value
    value - filled
  end
end


