cart = {}

loop do
  print 'Название товара или stop для завершения: '
  item_name = gets.chomp
  if item_name == 'stop'
    break
  end

  print 'Цена: '
  item_price = gets.to_f
  print 'Количество: '
  item_count = gets.to_f

  item = { price: item_price, count: item_count }
  cart[item_name] = item
end

result_of_sum = 0.0

puts 'Вы не добавили ни одной покупки' if cart.empty?

puts cart

cart.each do |key, value|
  price_of_item = value[:price] * value[:count]
  result_of_sum += price_of_item

  puts "Cумма #{key} - #{price_of_item}."
end

puts "Сумма всех товаров - #{result_of_sum}"