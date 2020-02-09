# frozen_string_literal: true

require_relative 'vagon.rb'

class PassengerVagon < Vagon
  def fill
    raise ArgumentError, 'Вагон уже полный' unless @filled < @value

    @filled += 1
  end
end
