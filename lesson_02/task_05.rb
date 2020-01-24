days_per_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

print 'Введите число:'
day = gets.chomp.to_i
print 'Введите месяц:'
month = gets.chomp.to_i
print 'Введите год:'
year = gets.chomp.to_i

days_per_months[1] = 29 if (year % 400).zero? || ((year % 4).zero? && year % 100 != 0)

result = 0

days_per_months.each_with_index do |value, index|
  if index + 1 < month
    result += value
  elsif index + 1 == month
    result += day
  end
end

puts "Порядковый номер вашей даты - #{result} дней!"
