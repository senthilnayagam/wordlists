

=begin
Thanks Mahendra for introducing me to Trie

http://telos.co.nz/articles/20-ruby-trie-example
http://ramblinglabs.com/blog/2012/02/rambling-trie-a-custom-trie-data-structure-implementation-in-ruby





=end

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

words = ['hello','help','heist','forest','hen',"smart","smooth","yellow","smile","smash","hole","smitten"]

words.each do |word|
    trie.build word
  end

pp trie.prefixed('z')
pp trie.prefixed('f')  
pp trie.prefixed('h')
pp trie.prefixed('he')
pp trie.prefixed('hel')
