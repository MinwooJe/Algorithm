import sys

input = sys.stdin.readline
print = sys.stdout.write

n = int(input())

for i in range(1, n+1):
    a, b = map(int, input().split())
    print("Case #%d: %d" %(i, a + b))
    print('\n')