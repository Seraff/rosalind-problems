require './helper'

protein = ARGV[0]

c = 1
protein.split('').each{ |aa| c *= REVERSED_CODON_TALBE[aa].count }
c *= REVERSED_CODON_TALBE['Stop'].count

puts c.modulo(1_000_000)
