#!/usr/bin/env ruby

codepoints = [3016,3007]
# 0BC8

$stdin.each_line do |line|
print=false
line.each_codepoint do |codepoint|
print=true if codepoints.include? codepoint
end      
      
      puts line if print
end