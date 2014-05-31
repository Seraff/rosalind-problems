require './helper'

def get_gc_content(string)
  gc = string.gsub(/[^GC]/, '').size
  ( gc.to_f * 100 / string.size ).round 4
end

datasets = read_fasta('input.fasta')

max_dataset = datasets.max_by{ |name, sequence| get_gc_content sequence }
puts max_dataset[0]
puts get_gc_content max_dataset[1]