#!/usr/bin/env ruby

=begin
http://blog.grayproductions.net/articles/ruby_19s_string
http://www.dzone.com/snippets/utf8-aware-string-methods-ruby
http://www.ssec.wisc.edu/~tomw/java/unicode.html

codepoint allocated for Tamil is between 2944 and 3071

32 is space character


usage 
cat tamil.html | ruby tamil_io.rb

=end





array  = []




$stdin.each_line do |line|
    result = ""
line.each_codepoint do |codepoint|
     if(( codepoint > 2944 && codepoint < 3071) || (codepoint == 32 ))
        result += codepoint.chr('UTF-8')
        array << codepoint
      end
end      
      result =  result.gsub(/\s\s+/,' ')
      puts result unless result.length <2 # \n or \c\r
end  

