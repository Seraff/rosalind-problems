Hash[ARGV[0].split(' ').group_by{|a| a}.map{|k, v| [k, v.count]}].each{|k, v| puts "#{k} #{v}" }