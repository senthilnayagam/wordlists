#!/usr/bin/env ruby
=begin
there are many sentences, need to convert those as one word per line
=end

$stdin.each_line do |line|
    puts line.gsub(" ","\n")
end 
