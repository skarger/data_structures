require 'set'
# Enter your code here. Read input from STDIN. Print output to STDOUT
N, i = gets.split.map{|x| x.to_i}

# you might need to define some more collections or data structured or variables
class Node
  attr_accessor :id, :visited

  def initialize(id)
    @id = id
    @visited = false
  end
end

vertices = (0..N-1).reduce({}) do |vs, i|
  vs[i] = Node.new(i)
  vs
end

edges = (0..N-1).reduce({}) do |h, i|
    h[i] = [i]
    h
end

i.times do
    a, b = gets.split.map{|x| x.to_i}
    edges[a] << b
    edges[b] << a

    # Store a and b in an appropriate data structure

end

def explore(c, v, vertices, edges)
  es = edges[v.id]
  if !es.nil?
    es.each do |e|
      if !vertices[e].visited
        c.add(vertices[e].id)
        vertices[e].visited = true
        explore(c, vertices[e], vertices, edges)
      end
    end
  end
  c
end

countries = []
vertices.each do |k, v|
  if !v.visited
    v.visited = true
    c = Set.new([v.id])
    c.merge(explore(c, v, vertices, edges))
    countries << c
  end
end


result = 0
remaining = N
countries.each do |c|
    remaining -= c.size
    result += c.size * remaining
end

# Write the code to compute the result
puts result
