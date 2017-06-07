#!/bin/ruby

require 'set'

q = gets.strip.to_i
for a0 in (0..q-1)
    n,m,cl,cr = gets.strip.split(' ')
    n = n.to_i
    m = m.to_i
    cl = cl.to_i
    cr = cr.to_i
    
    if cl <= cr
        puts cl * n
        next
    end
    # cl > cr, so if we can connect a city (directly or not)
    # to a city with a library then it is cheaper
    
    connected_sets = {}
    (1..n).each do |i|
        connected_sets[i] = Set.new([i])
    end
    
    for a1 in (0..m-1)
        city_1,city_2 = gets.strip.split(' ')
        city_1 = city_1.to_i
        city_2 = city_2.to_i
        
        set_for_pair = Set.new[city_1, city_2]
        union = connected_sets[city_1].merge(connected_sets[city_2]).merge(set_for_pair)
        connected_sets[city_1] = union
    end
    n_libraries = connected_sets.count
    n_roads = connected_sets.map {|cs| cs.count - 1}.sum
    
    puts n_libraries * cl + n_roads * cr
end
