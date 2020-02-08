require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'cargo_vagon.rb'
require_relative 'passenger_train.rb'
require_relative 'passenger_vagon.rb'

#str = /^[\w\d]{3}-?[\w\d]{2}$/i
str = /[а-яА-Я0-9]{3}-?[а-яА-Я0-9]{2}/

p ('ФЫВ-2' != str).nil?
p ('22222' =~ str).nil?
p ('ASD22' =~ str).nil?
p ('44321' =~ str).nil?
p ('ЫВФ-22' =~ str).nil?

