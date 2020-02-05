require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'cargo_vagon.rb'
require_relative 'passenger_train.rb'
require_relative 'passenger_vagon.rb'

p 'Instances'
p Train.instance_variables
p 'Class'
p Train.class_variables

 train = Train.new('2222')
p Train.instances

p train1 = Train.new('123')
p Train.instances

p train2 = Train.new('333')
p Train.instances

