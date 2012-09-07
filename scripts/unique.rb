#!/usr/bin/env ruby
require "facets"
require "pp"
paragraph = ""
$stdin.each_line do |line|
    paragraph += line
end 
words = paragraph.split " "
wf = words.frequency

pp wf