package provide bag 1.0
# Bag: a container for a group of items
# Note: items are strings that do not contain whitespace
# Supported operations:
# add - add item to bag
# remove - remove one occurrence (if any) from bag
# num_items - return number of items in the bag
# grab - get a random item from the bag without removing it
# to_array - get an array containing the current contents of the bag

proc bag_new {name} {
    upvar $name b
    array set b [list {num_items} {0} {contents} {""}]
}

proc add {bag item} {
    upvar $bag b
    if {$b(num_items) == 0} {
        set b(contents) "$item"
    } else {
        set b(contents) "$b(contents) $item"
    }
    incr b(num_items)
}

proc remove {bag item} {
    upvar $bag b
    if {$b(num_items) == 0} {
        puts "cannot remove from empty bag"
        return
    }
    regsub $item $b(contents) "" temp
    set b(contents) [string trim $temp]
    incr b(num_items) -1
}

proc contains {bag item} {
    upvar $bag b
    set result [regexp $item $b(contents) match]
    return $result
}

proc grab {bag} {
    upvar $bag b
    if {$b(num_items) == 0} {
        puts "cannot grab from empty bag"
        return
    }        
    set lst [split $b(contents)]
    set len [llength $lst]
    set idx [expr int( floor( $len * rand() ) )]
    return [lindex $lst $idx]
}

proc num_items {bag} {
    upvar $bag b
    return $b(num_items)
}

proc to_array {bag} {
    upvar $bag b
    set bl [split $b(contents)]
    return $bl
}

proc to_string {bag} {
    upvar $bag b
    return $b(contents)
}
