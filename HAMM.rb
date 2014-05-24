def get_hamm_distance(s1, s2)
  distance = 0
  s1.split('')
    .each_with_index{ |c, i| distance += 1 if c != s2[i] }
  distance
end

s, t = ARGV[0], ARGV[1]
exit if !(s && t) || s.size != t.size

puts get_hamm_distance(s, t)
