class Node:
    def __init__(self, value = 0, next = None, prev = None):
        self.value = value
        self.next = next
        self.prev = prev
    
class Doubly_linked_list:
    def __init__(self):
        self.head = None
        self.tail = None
        self.size = 0

    def insert_back(self, value):
        new_node = Node(value)
        if self.head is None:
            self.head = new_node
            self.tail = new_node
        else:
            self.tail.next = new_node
            new_node.prev = self.tail           # Doubly는 이걸 추가해줘야 됨.
            self.tail = self.tail.next
        self.size += 1                          # size 변경하는 코드 추가

    def remove_back(self):
        if self.head is None:                   # 리스트에 노드가 없을 경우
            return
        elif self.head == self.tail:            # 리스트에 노드가 하나만 있을 경우
            self.head = None
            self.tail = None
            self.size -= 1
        else:
            self.tail = self.tail.prev          # 이 구현 때문에 보통 dobuly에서만 구현함.
            self.tail.next = None
            self.size -= 1

    def get(self, idx):
        if idx < 0 or idx >= self.size:
            raise Exception("out of range")
        current = self.head
        for _ in range(idx):
            current = current.next
        return current.value
    
    def insert(self, idx, value):
        if idx < 0 or idx >= self.size:
            raise Exception("out of range")
        
        new_node = Node(value)
        
        if idx == 0:
            if self.head is None:
                self.head = new_node
                self.tail = new_node
            else:
                new_node.next = self.head
                self.head = new_node
                self.tail.prev = new_node
        else:
            current = self.head
            for _ in range(idx-1):
                current = current.next
            new_node.next = current.next   

            if current.next:
                current.next.prev = new_node
                new_node.next = current.next
                current.next = new_node
                new_node.prev = current
            else:
                self.insert_back(value)
    
    def remove(self, idx):
        if idx == 0:
            self.head = self.head.next
        else:
            current = self.head
            for _ in range(idx):
                current = current.next
            current.next.prev = current.prev
            current.prev.next = current.next

    def print(self):
        current = self.head
        if self.head is None:
            print("Empty Linked List")
        else:
            while(current):
                print(current.value, end="")
                current = current.next
                if current:
                    print("->", end="")
            print()


dl = Doubly_linked_list()
dl.print()
print('size:', dl.size)

dl.insert_back(9)
dl.print()
print('size:', dl.size)

dl.remove_back()
dl.print()
print('size:', dl.size)

# 추가한 것
# 1. insert_back() 메서드에 size를 변경하는 코드 추가
# 2. remove_back() 메서드를 리스트에 노드가 없거나 하나밖에 없을 때 사용시 예외처리, size 변경하는 코드 추가
# 3.