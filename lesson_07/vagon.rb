require_relative 'manufacturer.rb'
require_relative 'validation.rb'

class Vagon
  include Manufacturer
  include Validation
  attr_reader :value, :number, :filled
  validate :value, :presense
  validate :value, :type, Numeric

  def initialize(value)
    @value = value
    @filled = 0
    @number = rand(300)
  end

  def fill(value)
    unless (value + @filled) < @value
      raise ArgumentError, "Вы пытаетесь занять #{value} объема, " \
        " а всего у вагона #{@value}"
    end

    @filled += value
  end

  def free_value
    value - filled
  end
end
