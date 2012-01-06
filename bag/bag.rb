
=begin
    Bag: a container for a group of items
    Supported operations:
    add - add item to bag
    remove - remove one occurrence (if any) from bag
    num_items - return number of items in the bag
    grab - get a random item from the bag without removing it
    contains - return true if bag contains item, false otherwise
    to_array - get an array containing the current contents of the bag
=end

class Bag
    def initialize
        @contents = []
    end

    def to_s
        @contents.to_s
    end

    def add(item)
        @contents.push(item)
    end

    def remove(item)
        i = @contents.index(item)
        if i != nil
            @contents.delete_at(i)
        end 
    end

    def num_items
        return @contents.length
    end

    def grab
        return @contents.at(rand(@contents.length))
    end

    def contains(item)
        return (@contents.index(item) != nil)
    end

    def to_array
        a = @contents.dup
        return a
    end
end

