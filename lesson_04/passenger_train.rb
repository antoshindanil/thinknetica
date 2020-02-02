class PassengerTrain < Train
  def attach_vagon(vagon)
    super(vagon) if vagon.class == PassengerVagon
  end
end