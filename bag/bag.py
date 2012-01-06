import random

class Bag:
    """
    Bag: a container for a group of items
    Supported operations:
    add - add item to bag
    remove - remove one occurrence (if any) from bag
    num_items - return number of items in the bag
    grab - get a random item from the bag without removing it
    to_array - get an array containing the current contents of the bag
    """

    def __init__(self):
        self.contents = []
        self.n = 0

    def add(self, item):
        self.contents.append(item)
        self.n += 1

    def remove(self, item):
        try:
            self.contents.remove(item)
            self.n -= 1
        except:
            print "item not in bag"

    def contains(self, item):
        return (item in self.contents)
        
    def num_items(self):
        return self.n

    def grab(self):
        i = random.randint(0, len(self.contents)-1)
        return self.contents[i]

    def to_array(self):
        return list(self.contents)
        
