array_of_num = []

(10..100).each do |num|
  array_of_num.push(num)if num % 5.zero?
end

puts array_of_num
