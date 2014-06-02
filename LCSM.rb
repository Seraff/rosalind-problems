require './helper'

def find_motif(motif, seqs)
  seqs.each do |seq|
    return false unless seq.index(motif)
  end
  true
end

seqs = read_fasta('input.fasta')

base_seq = seqs.values[1]
motif = ''
found = false

(1..base_seq.size).to_a.reverse.each do |size|
  allowed_shifts = (0..(base_seq.size-size)).to_a

  allowed_shifts.each do |shift|
    motif = base_seq.slice(shift, size)
    if find_motif(motif, seqs.values)
      found = true
      break
    end
  end

  break if found
end

puts motif

