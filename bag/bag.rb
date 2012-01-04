
=begin
    Bag: a container for a group of items
    Supported operations:
    add - add item to bag
    remove - remove one occurrence (if any) from bag
    num_items - return number of items in the bag
    grab - get a random item from the bag without removing it
    to_array - get an array containing the current contents of the bag
=end

class Bag
    def initialize
        @contents = []
        @num_items = 0 
    end

    def to_s
        @contents.to_s
    end

    def add()

    end
end
