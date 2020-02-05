railway = Railway.new
railway.start

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

  next unless (1..14).include?(instruct)

  case instruct
  when 1
    railway.select_station
  when 2
    railway.create_train
  when 3
    railway.create_route
  when 4
    railway.station_operation_with_route('add')
  when 5
    railway.station_operation_with_route('delete')
  when 6
    railway.setup_route_to_train
  when 7
    railway.attach_vagon_to_train
  when 8
    railway.detach_vagon_from_train
  when 9
    railway.train_go_next
  when 10
    railway.train_go_prev
  when 11
    railway.stations_list_with_index_and_trains
  when 12
    railway.route_list
  when 13
    railway.trains_list_with_number_route_vagon
  when 14
    break
  end
end
