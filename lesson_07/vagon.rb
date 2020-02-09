# frozen_string_literal: true

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
