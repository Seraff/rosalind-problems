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

def dna_to_prot(dna)
    dna.gsub(/\w{3}/, CODON_TABLE).split('Stop').first
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
