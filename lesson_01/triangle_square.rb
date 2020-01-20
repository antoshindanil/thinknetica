puts 'Введите основание треугольника (a)'
a_triangle = gets.chomp.to_f

puts 'Введите высоту треугольника (h)'
h_triangle = gets.chomp.to_f

square_triangle = 0.5 * a_triangle * h_triangle
puts square_triangle
