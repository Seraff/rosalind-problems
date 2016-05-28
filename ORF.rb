require './helper'

src_protein = ARGV[0]

start = "ATG"
stops = ["TAA", "TAG", "TGA"]

results = []

[src_protein, reversed_sequence(src_protein)].each do |protein|
  protein.size.times do |i|
    if protein[i, 3] == start
      protein[i+3..-1].split(//).each_slice(3).to_a.map(&:join).each_with_index do |aa, j|
        if stops.include? aa
          results << protein[i, j*3+3]
          break
        end
      end
    end
  end
end

results.uniq.each { |r| puts dna_to_prot(r) }


