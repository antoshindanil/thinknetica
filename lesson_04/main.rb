require_relative "Station.rb"
require_relative "Route.rb"
require_relative "Train.rb"
require_relative "CargoTrain.rb"
require_relative "CargoVagon.rb"
require_relative "PassengerTrain.rb"
require_relative "PassengerVagon.rb"

station1 = Station.new('Москва')
station2 = Station.new('Питер')
station3 = Station.new('Казать')
station4 = Station.new('Калининград')

route1 = Route.new(station1, station2)
route2 = Route.new(station3, station4)

cargo_train = CargoTrain.new('№83452')
passenger_train = PassengerTrain.new('№21395')

stations = [station1, station2, station3, station4]
routes = [route1, route2]
trains = [cargo_train, passenger_train]

loop do
  puts 'Введите 1, чтобы создать станцию'
  puts 'Введите 2, чтобы создать поезд'
  puts 'Введите 3, чтобы создавать маршруты'
  puts 'Введите 4, чтобы добавить станцую в маршрут'
  puts 'Введите 5, чтобы удалить станцую из маршрута'
  puts 'Введите 6, чтобы назначать маршрут поезду'
  puts 'Введите 7, чтобы добавлять вагоны к поезду'
  puts 'Введите 8, чтобы отцеплять вагоны от поезда'
  puts 'Введите 9, чтобы перемещать поезд по маршруту вперед'
  puts 'Введите 10, чтобы переместить поезд по маршруту назад'
  puts 'Введите 11, чтобы посмотреть станции'
  puts 'Введите 12, чтобы посмотреть маршруты'
  puts 'Введите 13, чтобы посмотреть поезда'
  puts 'Введите 14, чтобы выйти'
  
  instruct = gets.chomp.to_i

  if (1..14).include?(instruct)
    case instruct
    when 1
      puts "Введите название станции:"
      stations.push(Station.new(gets.chomp))

    when 2
      puts 'Введите номер поезда:'
      number = gets.chomp
      puts 'Тип поезда: Cargo или Passenger'
      type = gets.chomp
      if type == 'Cargo'
        trains.push(CargoTrain.new(number))
      elsif type == 'Passenger'
        trains.push(PassengerTrain.new(number))
      else
        puts 'Неверный тип поезда'
      end

    when 3
      stations.map.with_index {|station, index| puts "Имя станции #{station.name}, ее индекс #{index}"}
      
      puts "Введите индекс начальной станции:"
      first_station_index = gets.chomp.to_i
      first_station = stations[first_station_index]

      puts "Введите индекс конечной станции:"
      last_station_index = gets.chomp.to_i
      last_station = stations[last_station_index]

      routes.push(Route.new(first_station, last_station))

    when 4 
      puts 'Выберете маршрут'
      routes.map.with_index {|route, index| puts "Маршрут #{route.list_of_stations.map {|station| station.name}}, его индекс #{index}"}
      selected_index = gets.chomp.to_i
      selected_route = routes[selected_index]

      routes.map.with_index {|station, index| puts "Имя станции #{station.name}, ее индекс #{index}"}
      puts 'Введите индекс станции, которую хотите добавить'
      selected_station_index = gets.chomp.to_i
      selected_route.add(stations[selected_station_index])

    when 5
      puts 'Выберете маршрут'
      routes.map.with_index {|route, index| puts "Маршрут #{route.list_of_stations.map {|station| station.name}}, его индекс #{index}"}
      selected_index = gets.chomp.to_i
      selected_route = routes[selected_index]

      selected_route.list_of_stations.map.with_index {|station, index| puts "Имя станции #{station.name}, ее индекс #{index}"}
      puts 'Введите индекс станции, которую хотите удалить'
      selected_station_index = gets.chomp.to_i
      selected_route.delete(selected_route.list_of_stations[selected_station_index])

    when 6
      puts 'Выберете поезд'
      trains.each_with_index {|train, index| puts "#{train.type} поезд с номером #{train.number}, его индекс #{index}"}
      selected_index = gets.chomp.to_i
      selected_train = trains[selected_index]

      puts 'Выберете маршрут'
      routes.map.with_index {|route, index| puts "Маршрут #{route.list_of_stations.map {|station| station.name}}, его индекс #{index}"}
      selected_index = gets.chomp.to_i
      selected_route = routes[selected_index]

      selected_train.add_route(selected_route)
      
    when 7
      puts 'Выберете поезд'
      trains.each_with_index {|train, index| puts "#{train.type} поезд с номером #{train.number}, его индекс #{index}"}
      selected_index = gets.chomp.to_i
      selected_train = trains[selected_index]

      if selected_train.type == 'Cargo'
        selected_train.attach_vagon(CargoVagon.new)
      else
        selected_train.attach_vagon(PassengerVagon.new)
      end
      
    when 8
      puts 'Выберете поезд'
      trains.each_with_index {|train, index| puts "#{train.type} поезд с номером #{train.number}, его индекс #{index}"}
      selected_index = gets.chomp.to_i
      selected_train = trains[selected_index]
      selected_train.detach_vagon

    when 9
      puts 'Выберете поезд'
      trains.each_with_index {|train, index| puts "#{train.type} поезд с номером #{train.number}, его индекс #{index}"}
      selected_index = gets.chomp.to_i
      selected_train = trains[selected_index]
      selected_train.go_next

    when 10
      puts 'Выберете поезд'
      trains.each_with_index {|train, index| puts "#{train.type} поезд с номером #{train.number}, его индекс #{index}"}
      selected_index = gets.chomp.to_i
      selected_train = trains[selected_index]
      selected_train.go_previous

    when 11
      stations.each {|station| puts "Станция #{station.name}, поезда на ней #{station.trains.map {|train| train.number}}"}

    when 12
      routes.each {|route| puts "Маршрут #{route.list_of_stations.map {|station| station.name}}"}

    when 13
      trains.each {|train| puts "#{train.type} поезд с номером #{train.number} и маршрутом #{train.current_route}, а также вагонами #{train.vagons}"}

    when 14
      break
    end
    else
  end
end
