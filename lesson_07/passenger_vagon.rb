require_relative 'vagon.rb'

class PassengerVagon < Vagon
  attr_reader :filled_seats, :seats_count, :number

  def initialize(seats_count)
    @seats_count = seats_count
    @filled_seats = 0
    @number = rand(300)
  end

  def fill_seat
    @filled_seats += 1
  end

  def free_seats
    seats_count - filled_seats
  end
end
