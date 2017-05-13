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
        

    def append_children(self, level_sets, level):
        if all(node is None for node in level):
            return True
        else:
            level_sets.append(level)
            return False

    def bft(self):
        root_level = [root]
        level_sets = [root_level]
        process_level = self.append_children
        self.traverse(process_level, level_sets, root_level)
        return level_sets

    def traverse(self, process_level, accumulator, current_level):
        children = self.child_level(current_level)
        should_terminate = process_level(accumulator, children)
        if should_terminate:
            return
        else:
            self.traverse(process_level, accumulator, children)
        
    def child_level(self, level):
        nodes = []
        for n in level:
            if n is None:
                nodes += [None, None]
            else:
                nodes += [n.left, n.right]
        return nodes


    def __str__(self):
        level_sets = self.bft()
        tree_string = ""
        for level in level_sets:
            tree_string +=("---\n")
            for node in level:
                if node is not None:
                    tree_string += " {}".format(node.data)
                else:
                    tree_string += " X"
            tree_string += "\n"
        return tree_string



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
