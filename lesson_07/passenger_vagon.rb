require_relative 'vagon.rb'

class PassengerVagon < Vagon
  def fill
    if @filled < @value
      @filled += 1
    else
      raise ArgumentError, 'Вагон уже полный'
    end
  end
end
