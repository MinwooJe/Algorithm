class Node:
    def __init__(self, value = 0, next = None):
        self.value = value
        self.next = next

class Linkedlist:
    def __init__(self):
        self.head = None
        self.tail = None
        self.size = 0

    def append(self, value):
        new_node = Node(value)
        
        if self.head == None:
            self.head = new_node
            self.tail = new_node
        else:
            self.tail.next = new_node
            self.tail = new_node
        self.size += 1
        return print(f'append {new_node}')
    
    def get(self, idx):
        if idx < 0 and idx > self.size:
            raise Exception("out of range")
        current = self.head
        for _ in range(idx):
            current = current.next
        return print(current.value)
    
    def insert(self, idx, value):
        if idx < 0 and idx > self.size:
            raise Exception("out of range")
        
        new_node = Node(value)

        if idx == 0:
            self.head = new_node
            self.tail = new_node
        current = self.head
        for _ in range(idx - 1):
            current = current.next
        new_node.next = current.next
        current.next = new_node
        self.size += 1
        return print(f'insert {new_node}')

    
    def remove(self, idx):
        if idx == 0:
            self.head = self.head.next
        else:
            current = self.head
            for _ in range(idx - 1):
                current = current.next
            current.next = current.next.next


ll = Linkedlist()
ll.append(1)
ll.get(100)
            