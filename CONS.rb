require './helper'

seqs = read_fasta('input.fasta')
length = seqs.first[1].size
profile = Hash[["A", "C", "G", "T"].map{ |n| [n, [0]*length]}]

seqs.values.each do |seq|
  seq.split('').each_with_index{ |s, i| profile[s][i] += 1 }
end

consensus = ""
length.times do |i|
  consensus += profile.max_by{ |p| p[1][i] }[0]
end

puts consensus
profile.each{ |k, v| puts "#{k}: #{v.join(' ')}" }