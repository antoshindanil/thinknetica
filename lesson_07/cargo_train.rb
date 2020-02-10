require_relative 'cargo_vagon.rb'

class CargoTrain < Train
  def attach_vagon(vagon)
    super(vagon) if vagon.class == CargoVagon
  end
end
