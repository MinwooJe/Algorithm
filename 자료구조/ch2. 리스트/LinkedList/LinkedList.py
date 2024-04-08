class Node:
    def __init__(self, value=0, next=None):
        self.value = value
        self.next = next

class Linked_list:
    def __init__(self):
        self.head = None
        self.tail = None
        self.size = 0
    
    # O(n)
    def append_1(self, value):
        new_node = Node(value)
        if self.head == None:
            self.head = new_node
            self.tail = new_node
        else:
            current = self.head
            while current.next is not None:
                current = current.next
            current.next = new_node
        self.size += 1
    
    # O(1)
    def append_2(self, value):
        new_node = Node(value)
        if self.head == None:
            self.head = new_node
            self.tail = new_node
        else:
            self.tail.next = new_node
            self.tail = new_node
        self.size += 1
    
    # O(n)
    def get(self, idx):
        if idx < 0 or idx >= self.size:
            raise Exception('out of range')
        else:
            current = self.head
            for _ in range(idx):
                current = current.next
        return current.value
    
    # 리스트의 처음과 끝에 삽입 할 때 : O(1), 리스트의 중간에 삽입할 때 O(n)
    def insert(self, idx, value):
        if idx < 0 or idx >= self.size:          # out of range 예외 처리
            raise Exception('out of range')
        else:
            new_node = Node(value)
            current = self.head
            if idx == 0:                         # 리스트의 맨 처음에 삽입 할 때
                new_node.next = self.head
                self.head = new_node
                self.size += 1
            elif idx == self.size:               # 리스트의 맨 뒤에 삽입 할 때
                self.append_2(value)
            else:                                # 리스트의 중간에 삽입할 때 
                for _ in range(idx-1):
                    current = current.next
                current.next = new_node
                self.size += 1                       # size 추가 잊지말기 
        
    # 
    def remove(self, idx):
        if idx < 0 or idx >= self.size:
            raise Exception('out of range')
        else:
            if idx == 0:                            # O(1)
                self.head = self.head.next
            else:                                   # O(n)
                current = self.head
                for _ in range(idx-1):
                    current = current.next
                current.next = current.next.next
                self.size -= 1
        # 마지막 원소 제거할 때 tail 업데이트 하는 로직 추가 -> O(n)
