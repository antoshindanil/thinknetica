vowels = ['a', 'e', 'i', 'o', 'u', 'y']
alphabet = ('a'..'z').to_a
result = {}

alphabet.each_with_index do |char, index|
  result[char] = index + 1 if vowels.include?(char)
end

puts result
