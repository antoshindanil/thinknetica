puts 'Введите первую сторону треугольника'
first_side = gets.chomp.to_f

puts 'Введите вторую сторону треугольника'
second_side = gets.chomp.to_f

puts 'Введите третью сторону треугольника'
third_side = gets.chomp.to_f

c_side, a_side, b_side = [first_side, second_side, third_side].max(3)

if c_side**2 == b_side**2 + a_side**2
  puts 'Данный треугольник является прямоугольным'
elsif c_side == b_side && c_side == a_side && b_side == a_side
  puts 'Данный треугольник равнобедренным и равносторонним, но не прямоугольным'
elsif c_side == b_side || c_side == a_side || b_side == a_side
  puts 'Данный треугольник является равнобедренным'
end
