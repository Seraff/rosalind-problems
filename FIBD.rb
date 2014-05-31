n, m = ARGV[0].to_i, ARGV[1].to_i

rabbits = [1, 1]
adults = [0, 1]
children = [1, 0]

(n - 2).times do |i|
  children << adults[-1]
  adults << children[-2] + adults[-1] - children[-m-1].to_i
  rabbits << children[-1] + adults[-1]
end

puts rabbits[-1]