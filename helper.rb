CODON_TABLE = { "UUU" => "F", "UUC" => "F", "UUA" => "L",
    "UUG" => "L", "UCU" => "S", "UCC" => "S", "UCA" => "S",
    "UCG" => "S", "UAU" => "Y", "UAC" => "Y", "UAA" => "Stop",
    "UAG" => "Stop", "UGU" => "C", "UGC" => "C", "UGA" => "Stop",
    "UGG" => "W", "CUU" => "L", "CUC" => "L", "CUA" => "L",
    "CUG" => "L", "CCU" => "P", "CCC" => "P", "CCA" => "P",
    "CCG" => "P", "CAU" => "H", "CAC" => "H", "CAA" => "Q",
    "CAG" => "Q", "CGU" => "R", "CGC" => "R", "CGA" => "R",
    "CGG" => "R", "AUU" => "I", "AUC" => "I", "AUA" => "I",
    "AUG" => "M", "ACU" => "T", "ACC" => "T", "ACA" => "T",
    "ACG" => "T", "AAU" => "N", "AAC" => "N", "AAA" => "K",
    "AAG" => "K", "AGU" => "S", "AGC" => "S", "AGA" => "R",
    "AGG" => "R", "GUU" => "V", "GUC" => "V", "GUA" => "V",
    "GUG" => "V", "GCU" => "A", "GCC" => "A", "GCA" => "A",
    "GCG" => "A", "GAU" => "D", "GAC" => "D", "GAA" => "E",
    "GAG" => "E", "GGU" => "G", "GGC" => "G", "GGA" => "G", "GGG" => "G" }

REVERSED_CODON_TALBE = {
    "F"=>["UUU", "UUC"],
    "L"=>["UUA", "UUG", "CUU", "CUC", "CUA", "CUG"],
    "S"=>["UCU", "UCC", "UCA", "UCG", "AGU", "AGC"],
    "C"=>["UGU", "UGC"],
    "W"=>["UGG"],
    "P"=>["CCU", "CCC", "CCA", "CCG"],
    "H"=>["CAU", "CAC"],
    "Q"=>["CAA", "CAG"],
    "R"=>["CGU", "CGC", "CGA", "CGG", "AGA", "AGG"],
    "I"=>["AUU", "AUC", "AUA"],
    "M"=>["AUG"],
    "T"=>["ACU", "ACC", "ACA", "ACG"],
    "N"=>["AAU", "AAC"],
    "K"=>["AAA", "AAG"],
    "V"=>["GUU", "GUC", "GUA", "GUG"],
    "A"=>["GCU", "GCC", "GCA", "GCG"],
    "D"=>["GAU", "GAC"],
    "E"=>["GAA", "GAG"],
    "G"=>["GGU", "GGC", "GGA", "GGG"],
    "Y"=>["UAU", "UAC"],
    "Stop"=>["UAA", "UAG", "UGA"]
}

MASS_TABLE = {"A" => 71.03711, "C" => 103.00919, "D" => 115.02694,
    "E" => 129.04259, "F" => 147.06841, "G" => 57.02146, "H" => 137.05891,
    "I" => 113.08406, "K" => 128.09496, "L" => 113.08406, "M" => 131.04049,
    "N" => 114.04293, "P" => 97.05276, "Q" => 128.05858, "R" => 156.10111,
    "S" => 87.03203, "T" => 101.04768, "V" => 99.06841, "W" => 186.07931, "Y" => 163.06333
}

def rna_to_prot(rna)
    rna.gsub(/\w{3}/, CODON_TABLE).split('Stop').first
end

def dna_to_prot(dna)
    dna.gsub('T', 'U').gsub(/\w{3}/, CODON_TABLE).split('Stop').first
end

def get_mass(protein)
    protein.split('').map{ |e| MASS_TABLE[e] }.inject{ |s, e| s += e }
end

def read_fasta(filename)
    f = File.open(filename, 'r')
    datasets = {}

    current_dataset = nil
    while string = f.gets
      if string.match(/\A\>.+/)
        current_dataset = string.gsub(/[\>\n]/, '')
        datasets.merge!({current_dataset => ''})
      else
        datasets[current_dataset] += string.gsub("\n", "")
      end
    end
    f.close()
    datasets
end

def reversed_sequence(dna)
    match = { 'G' => 'C', 'T' => 'A', 'A' => 'T', 'C' => 'G' }
    dna.reverse.gsub(/[GTAC]/, match)
end
