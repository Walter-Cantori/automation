require './vehicle_class.rb'
require './motorcycle_class.rb'

my_moto = Motorcycle.new(0, 1)
puts my_moto.doors
puts my_moto.get_engines

my_moto.set_price(10_000)
my_moto.brand = 'Yamaha'

puts my_moto.get_price
puts my_moto.brand

my_car = Vehicle.new(4, 1)
puts my_car.doors
puts my_car.get_engines

my_car.doors = 5
my_car.set_engines(2)
puts my_car.doors
puts my_car.get_engines

