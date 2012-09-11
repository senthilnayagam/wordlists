#!/usr/bin/env ruby
class Trie
  def initialize
    @root = Hash.new
  end
 
  def build(str) 
    node = @root    
    str.each_char do |ch|
      node[ch] ||= Hash.new
      node = node[ch]
    end
    node[:end] = true
  end
 
  def find(str) 
    node = @root
    str.each_char do |ch|
      return nil unless node = node[ch]
    end
    node[:end] && true
  end
end




require 'pp'
trie = Trie.new

words = ['hello','help','heist','forest','hen']

words.each do |word|
    trie.build word
  end
  
pp trie.find('he')