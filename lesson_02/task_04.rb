vowels = ['a', 'e', 'i', 'o', 'u', 'y']
alphabet = ('a'..'z').to_a
result = {}

alphabet.each.with_index(1) do |char, index|
  result[char] = index if vowels.include?(char)
end

puts result
