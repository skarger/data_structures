class Node(object):
    def __init__(self, data, left, right):
        self.data = data
        self.left = left
        self.right = right

class Tree(object):
    def __init__(self, root):
        self.root = root

    def insert(self, data):
        new_node = Node(data, None, None)
        self.insert_at(self.root, new_node)

    def insert_at(self, parent, node):
        if node.data == parent.data:
            return
        if node.data < parent.data:
            if parent.left is None:
                parent.left = node
                return
            else:
                self.insert_at(parent.left, node)
        else:
            if parent.right is None:
                parent.right = node
                return
            else:
                self.insert_at(parent.right, node)
        

    def __str__(self):
        level = 0
        level_sets = {}
        indent_before_root = 80
        level_sets = self.gather(self.root, level, level_sets, indent_before_root)
        lines = []
        for idx, k in enumerate(sorted(level_sets.keys())):
            line = [" "] * 160
            for indent, data in level_sets[k]:
                if data is not None:
                    line[indent] = str(data)
            lines.append("".join(line))
        return "\n".join(lines)

    def gather(self, parent, level, level_sets, indent):
        if not level in level_sets:
            level_sets[level] = []

        if parent is None:
            level_sets[level].append((indent, None))
            return level_sets
        
        level_sets[level].append((indent, parent.data))
        level_sets = self.gather(parent.left, level + 1, level_sets, int(indent - (20 / (level + 1))))
        level_sets = self.gather(parent.right, level + 1, level_sets, int(indent + (20 / (level + 1))))
        return level_sets


if __name__ == "__main__":
    root = Node(4, None, None)
    tree = Tree(root)
    tree.insert(2)
    tree.insert(6)
    tree.insert(1)
    tree.insert(3)
    tree.insert(5)
    tree.insert(7)
    print(str(tree))
