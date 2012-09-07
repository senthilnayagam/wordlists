=begin
http://blog.grayproductions.net/articles/ruby_19s_string
http://www.dzone.com/snippets/utf8-aware-string-methods-ruby
http://www.ssec.wisc.edu/~tomw/java/unicode.html



=end


strings = File.read("./tamil.html")

# puts strings
#puts strings.encoding.name
#puts strings.bytesize
#space = "  "
#space.each_codepoint do |codepoint| 
#puts codepoint
#end

result = ""
array  = []
strings.each_codepoint do |codepoint|
     if(( codepoint > 2944 && codepoint < 3071) || (codepoint == 32 ))
       #puts codepoint
       result += codepoint.chr('UTF-8')
       array << codepoint
     end
end

puts result

#puts array.sort.uniq
#strings.each do