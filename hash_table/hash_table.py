class Item(object):
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __str__(self):
        return "{} : {}".format(self.name, self.age)

class HashTable(object):
    TABLE_SIZE = 100

    def __init__(self):
        self.buckets = [[] for i in range(self.TABLE_SIZE)]

    def insert(self, name, age):
        item = Item(name, age)
        key = self.hash_key(name)
        # separate chaining
        self.buckets[key].append(item)
        return key

    def hash_key(self, value):
        return len(value) % self.TABLE_SIZE

    def access(self, name):
        key = self.hash_key(name)
        bucket = self.buckets[key]
        for item in bucket:
            if item.name == name:
                return item


if __name__ == "__main__":
    ht = HashTable()
    k1 = ht.insert("Stephen", 32)
    k2 = ht.insert("Cat", 5)
    k3 = ht.insert("Dog", 10)

    print(ht.access("Cat"))
    print(ht.access("Stephen"))
    print(ht.access("Dog"))
