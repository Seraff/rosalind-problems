n = 36; k = 2
rabbits = [1, 1]
while rabbits.size < n
  rabbits << rabbits[-2] * k + rabbits[-1]
end
puts rabbits[-1]