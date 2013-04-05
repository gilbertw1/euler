lines = IO.readlines('in_problem22.txt')
assoc_ary = ('A'..'Z').to_a.zip((1..26).to_a)
@char_map = Hash.new

assoc_ary.each do |x|
  @char_map[x[0]] = x[1]
end

def convert(str)
  tal = 0
  str.split(//).each do |x|
    tal += @char_map[x]
  end
  tal
end

position = 1
total = 0
words = eval("[#{lines[0]}]").sort

words.each do |word|
  total += convert(word) * position
  position += 1
end

puts total
