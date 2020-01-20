puts 'Введите первую сторону треугольника'
first_side = gets.chomp.to_f

puts 'Введите вторую сторону треугольника'
second_side = gets.chomp.to_f

puts 'Введите третью сторону треугольника'
third_side = gets.chomp.to_f

if first_side > second_side && first_side > third_side
  c_side = first_side
  a_side = second_side
  b_side = third_side
elsif second_side > first_side && second_side > third_side
  c_side = second_side
  a_side = first_side
  b_side = third_side
else
  c_side = third_side
  a_side = first_side
  b_side = second_side
end

if c_side**2 == b_side**2 + a_side**2
  puts 'Данный треугольник является прямоугольным'
elsif c_side == b_side && c_side == a_side && b_side == a_side
  puts 'Данный треугольник равнобедренным и равносторонним, но не прямоугольным'
elsif c_side == b_side || c_side == a_side || b_side == a_side
  puts 'Данный треугольник является равнобедренным'
end
