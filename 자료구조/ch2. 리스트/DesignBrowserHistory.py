class Node:
    def __init__(self, value = '', next = None, prev = None):
        self.value = value
        self.next = next
        self.prev = prev

class BrowserHistory:
    def __init__(self, url):
        self.homepage = Node(url)               # head
        self.tail = self.homepage               # tail
        self.current = self.homepage            # current
        self.size = 1                           # size
    
    def visit(self, url):                       # tail, current, size 변경해야 됨.
        new_node = Node(url)
        self.current.next = new_node
        new_node.prev = self.current
        self.current = self.current.next
        self.tail = new_node
        self.size += 1
        return self.current.value
    
    def back(self, steps):
        while steps > 0 and self.current.prev is not None:
            self.current = self.current.prev
            steps -= 1
        return print(self.current.value)

    def forward(self, steps):
        while steps > 0 and self.current.next is not None:
            self.current = self.current.next
            steps -= 1
        return print(self.current.value)
    
    def print(self):
        now = self.homepage
        for _ in range(self.size):
            print(now.value, end=',')
            now = now.next
        print('end')

a = BrowserHistory('leetcode.com')
a.visit('google.com')
a.visit('facebook.com')
a.visit('youtube.com')
a.back(1)
a.back(1)
a.forward(1)
a.visit('linkedin.com')
a.forward(2)
a.back(2)
a.back(7)