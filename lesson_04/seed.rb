require_relative "Station.rb"
require_relative "Route.rb"
require_relative "Train.rb"
require_relative "CargoTrain.rb"
require_relative "CargoVagon.rb"
require_relative "PassengerTrain.rb"
require_relative "PassengerVagon.rb"


st1 = Station.new('1')
st2 = Station.new('Station 2')
st3 = Station.new('Station 3')
st4 = Station.new('Station 4')
st5 = Station.new('Station 5')

g = gets.chomp.to_s
p g
p st1.name
p g === st1
p '1'=='1'

route = Route.new(st1, st5)
route.add(st2)
route.add(st3)
route.add(st4)

p pt1 = PassengerTrain.new('pt1')
p ct1 = CargoTrain.new('ct1')\

p vc1 = CargoVagon.new
p vp1 = PassengerVagon.new

pt1.add_route(route)
ct1.add_route(route)

p "___________________________"

p pt1.attach_vagon(vp1)
p pt1.attach_vagon(vc1)

p "___________________________"

p pt1.detach_vagon(vp1)

p "___________________________"

p pt1.go_next
p pt1.go_next

p "___________________________"

p st1.trains
p st2.trains
p st3.trains