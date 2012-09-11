#!/usr/bin/env ruby
require "csv"
require 'pp'

class Trie

  def initialize
    @root = {}
  end

  def build(string)
    node = @root
    string.chars.each do |char|
      node[char] ||= {}
      node = node[char]
    end
    
    node[:end] = true
  end

  def include?(word)
    node = @root
    word.chars.each do |char|
      return false if node.nil?
      node = node[char]
    end
    
    !!node and node[:end]
  end

  def to_a(node = @root, prefix = "", array = [])
    return array if node.nil?
    node.each do |key, value|
      key == :end ? array << prefix : to_a(value, prefix + key, array)
    end
    
    array
  end

  def prefixed(prefix, node = @root)
    prefix.chars.each do |char|
      return [] unless node[char]
      node = node[char]
    end
    
    to_a(node).map { |suffix| prefix + suffix }
  end

end



trie = Trie.new

words = []


  




dummy = []
data= {}
CSV.foreach("./shorthand_words.csv") do |row|
  # use row here...
   
temp = data[row[0]]
data[row[0]] = temp.to_a + [row[1]]
words << row[0]

end


words.each do |word|
    trie.build word
  end
  
 # data
=begin
data.keys.each do |k|
  puts data[k].length.to_s + " " +  k    if data[k].length > 1 
end
=end

tamil_chars = (2949..2954).to_a + (2958..2960).to_a + (2962..2964).to_a + [2965,2969,2970,2972,2974,2975,2979,2980,2984,2985,2986, 2990,2991,2992,2993,2994,2995,2996,2997,2999,3000,3001]


keys = data.keys
counter = 0
tamil_chars.each do |a|
  tamil_chars.each do |b|
    counter += 1
    
  prefix_key = a.chr('UTF-8') + b.chr('UTF-8')

#  if  keys.include? prefix_key  
#      puts '1 ' + prefix_key  
#  else
#      puts '0 ' + prefix_key   
#  end

result = trie.prefixed(prefix_key)
if result.length >0
  puts counter
pp prefix_key + "=>" 
#pp result

result.each do |r|
pp data[r]
end

end
  
end   
end  

