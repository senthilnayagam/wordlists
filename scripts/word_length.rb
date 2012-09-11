#!/usr/bin/env ruby

=begin
very short and very long words are not very useful for autocompletion, skipping them until I find a new solution for it
=end


MINLENGTH = 3
MAXLENGTH = 10

$stdin.each_line do |line|
    puts line if(( line.length < MAXLENGTH) && (line.length > MINLENGTH))
end 