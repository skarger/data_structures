# Bag: a container for a group of items
# Supported operations:
# add - add item to bag
# remove - remove one occurrence (if any) from bag
# num_items - return number of items in the bag
# grab - get a random item from the bag without removing it
# to_array - get an array containing the current contents of the bag

proc add {bag item} {
    set bag "$bag $item"
    set con [get_bag_contents $bag]
    set blist [split $bag " "]
    set num [lindex $blist 0]
    incr num
    set bag "$num $con"
    return $bag
}

proc get_bag_contents {bag} {
    set blist [split $bag " "]
    set rv ""
    set i 0
    foreach item $blist {
        if {$i == 1} {
            set rv [lindex $blist $i]
        } elseif {$i > 0} {
            set rv "$rv [lindex $blist $i]"
        }
        incr i
    }
    return $rv
}

proc num_items {bag} {
    set blist [split $bag " "]
    return [lindex $blist 0]
}

proc to_array {bag} {
    return [lindex $bag]
}



# the number of items in the bag is the first thing
set bag "0"

puts "An empty bag: [get_bag_contents $bag]"

set bag [add $bag steve]
puts -nonewline "Bag: [get_bag_contents $bag]"
puts " Size: [num_items $bag]"


set bag [add $bag karger]
puts -nonewline "Bag: [get_bag_contents $bag]"
puts " Size: [num_items $bag]"

