# frozen_string_literal: true

require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'cargo_vagon.rb'
require_relative 'passenger_train.rb'
require_relative 'passenger_vagon.rb'

class Railway
  attr_reader :stations, :routes, :trains

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def start
    station1 = Station.new('Москва')
    station2 = Station.new('Питер')
    station3 = Station.new('Казань')
    station4 = Station.new('Калининград')

    route1 = Route.new(station1, station2)
    route2 = Route.new(station3, station4)

    cargo_train = CargoTrain.new('№83452')
    passenger_train = PassengerTrain.new('№21395')

    @stations = [station1, station2, station3, station4]
    @routes = [route1, route2]
    @trains = [cargo_train, passenger_train]
  end

  def select_station
    puts 'Введите название станции:'
    @stations.push(Station.new(gets.chomp))
  end

  def create_train
    puts 'Введите номер поезда:'
    number = gets.chomp
    puts 'Тип поезда: Cargo или Passenger'
    type = gets.chomp

    if type == 'Cargo'
      @trains.push(CargoTrain.new(number))
    elsif type == 'Passenger'
      @trains.push(PassengerTrain.new(number))
    else
      puts 'Неверный тип поезда'
    end
  end

  def create_route
    first_station = create_route_select_station(@stations, 'начальной')
    last_station = create_route_select_station(@stations, 'конечной')

    @routes.push(Route.new(first_station, last_station))
  end

  def station_operation_with_route(operation)
    selected_route = select_route(@routes)

    case operation
    when 'add'
      index = stations_list_for_route(@stations, 'добавить')
      selected_route.add(@stations[index])
    when 'delete'
      index = stations_list_for_route(selected_route.list_of_stations, 'удалить')
      selected_route.delete(selected_route.list_of_stations[index])
    end
  end

  def setup_route_to_train
    selected_train = select_train(@trains)
    selected_route = select_route(@routes)

    selected_train.add_route(selected_route)
  end

  def attach_vagon_to_train
    selected_train = select_train(@trains)

    if selected_train.class == CargoTrain
      selected_train.attach_vagon(CargoVagon.new)
    elsif selected_train.class == PassengerTrain
      selected_train.attach_vagon(PassengerVagon.new)
    end
  end

  def detach_vagon_from_train
    selected_train = select_train(@trains)
    selected_train.detach_vagon
  end

  def train_go_next
    selected_train = select_train(@trains)
    selected_train.go_next
  end

  def train_go_prev
    selected_train = select_train(@trains)
    selected_train.go_previous
  end

  def stations_list_with_index_and_trains
    @stations.each do |station|
      puts "Станция #{station.name}, поезда на ней #{station.trains.map(&:number)}"
    end
  end

  def route_list
    @routes.each do |route|
      puts "Маршрут #{route.list_of_stations.map(&:name)}"
    end
  end

  def trains_list_with_number_route_vagon
    @trains.each do |train|
      puts "#{train.class} с номером #{train.number} и маршрутом #{train.current_route}, а также вагонами #{train.vagons}"
    end
  end

  private

  def stations_list_with_index(stations)
    stations.map.with_index do |station, index|
      puts "Имя станции #{station.name}, ее индекс #{index}"
    end
  end

  def select_route(routes)
    puts 'Выберете маршрут'
    routes.map.with_index do |route, index|
      puts "Маршрут #{route.list_of_stations.map(&:name)}, его индекс #{index}"
    end
    selected_index = gets.chomp.to_i
    @routes[selected_index]
  end

  def select_train(trains)
    puts 'Выберете поезд'
    trains.each_with_index do |train, index|
      puts "#{train} поезд с номером #{train.number}, его индекс #{index}"
    end
    selected_index = gets.chomp.to_i
    trains[selected_index]
  end

  def stations_list_for_route(stations, str)
    stations_list_with_index(stations)
    puts "Введите индекс станции, которую хотите #{str}"
    gets.chomp.to_i
  end

  def create_route_select_station(stations, str)
    stations_list_with_index(stations)
    puts "Введите индекс #{str} станции:"
    index = gets.chomp.to_i
    stations[index]
  end
end
