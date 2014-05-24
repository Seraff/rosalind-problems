def get_gc_content(string)
  gc = string.gsub(/[^GC]/, '').size
  ( gc.to_f * 100 / string.size ).round 4
end

f = File.open('fasta.txt', 'r')
datasets = {}

current_dataset = nil
while string = f.gets
  if string.match(/\A\>.+/)
    current_dataset = string.gsub('>', '')
    datasets.merge!({current_dataset => ''})
  else
    datasets[current_dataset] += string.gsub("\n", "")
  end
end

f.close()

max_dataset = datasets.max_by{ |name, sequence| get_gc_content sequence }
puts max_dataset[0]
puts get_gc_content max_dataset[1]