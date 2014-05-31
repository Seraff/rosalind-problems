require './helper'

seqs = read_fasta('input.fasta')
list = []
k = 3

seqs.each do |name, seq|
  prefix = seq[-3..-1]
  seqs.each do |k, v|
    list << [name, k] if v[0..2] == prefix && k != name
  end
end

list.each{ |e| puts e.join(' ') }