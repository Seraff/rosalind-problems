return unless (ARGV[0] && ARGV[1] && ARGV[2])

k, m, n = ARGV[0].to_f, ARGV[1].to_f, ARGV[2].to_f
count = k + m + n

p_mm = m/count * (m-1)/(count-1)
p_mn = m/count * n/(count-1)
p_nn = n/count * (n-1)/(count-1)
p_nm = n/count * m/(count-1)

p_yy = p_mm * 1/4 + p_mn * 1/2 + p_nn + p_nm * 1/2

result = 1 - p_yy
puts result.round(5)