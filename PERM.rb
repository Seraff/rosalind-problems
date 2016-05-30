n = ARGV[0].to_i

perm = (1..n).to_a.permutation(n)
puts perm.count
perm.each { |p| puts p.join(' ') }
