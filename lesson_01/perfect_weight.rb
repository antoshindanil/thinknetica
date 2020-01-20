puts 'Введите ваше Имя'
name = gets.chomp

puts "#{name}, введите ваш рост"
growth = gets.chomp.to_i

puts "#{name}, введите ваш вес"
weight = gets.chomp.to_i

ideal_weight = (growth - 110) * 1.15

if ideal_weight >= weight
  puts "#{name}, ваш вес уже оптимальный"
else
  puts "#{name}, вам есть к чему стремиться, ваш идеальный весь - #{ideal_weight.to_i}"
end
