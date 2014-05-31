f = File.open('r.txt', 'r')
wf = File.open('output.txt', 'w')
counter = 1
while str = f.gets
  wf.puts str if counter % 2 == 0
  counter += 1
end
f.close; wf.close