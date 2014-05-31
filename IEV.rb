integers = [ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i, ARGV[3].to_i, ARGV[4].to_i, ARGV[5].to_i]
probabilities = [1, 1, 1, 3.0/4, 1.0/2, 0]

sum = 0
integers.each_with_index do |count, i|
  sum += probabilities[i] * count * 2
end

puts sum