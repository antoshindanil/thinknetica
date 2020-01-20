puts 'Введите коэффицент a'
a_index = gets

puts 'Введите коэффицент b'
b_index = gets

puts 'Введите коэффицент c'
c_index = gets

discriminant = b_index**2 - 4 * a_index * c_index

if discriminant > 0
  x1 = (-b + Math.sqrt(discriminant)) / (2 * a_index)
  x2 = (-b - Math.sqrt(discriminant)) / (2 * a_index)
  puts "X1 равен #{x1}, а X2 равен #{x2}"
else
  puts 'Корней нет!'
end
