class PassengerTrain < Train
  
  def attach_vagon(vagon)
    if self.speed.zero?
       self.vagons << vagon
    else
      puts 'Остановите поезд'
    end
  end

  def type
    'Passenger'
  end

end
