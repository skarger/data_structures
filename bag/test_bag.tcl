# update path as necessary
set auto_path [linsert $auto_path 0 set dir ~/git/data_structures/bag]
package require bag


bag_new bag
puts "An empty bag: [to_string bag]"

puts "Test add"
add bag summer
puts -nonewline "Bag: [to_string bag] "
puts "Size: [num_items bag]"

add bag winter
puts -nonewline "Bag: [to_string bag] "
puts "Size: [num_items bag]"

add bag summer
puts -nonewline "Bag: [to_string bag] "
puts "Size: [num_items bag]"

puts "Test contains"
if {[contains bag "summer"]} {puts "Bag contains summer"}
if {![contains bag "blue"]} {puts "Bag does not contain blue"}

puts "Test to_array"
set bl [to_array bag]
puts -nonewline "{ "
foreach i $bl {
    puts -nonewline "$i "
}
puts "}"

puts "Test grab"
puts [grab bag]

puts "Test remove"
remove bag summer
puts -nonewline "Bag: [to_string bag] "
puts "Size: [num_items bag]"

remove bag summer
puts -nonewline "Bag: [to_string bag] "
puts "Size: [num_items bag]"


