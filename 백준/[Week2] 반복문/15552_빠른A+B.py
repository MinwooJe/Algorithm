# 입출력 방식이 느리면 여러 줄을 입력받거나 출력할 때 시간초과가 날 수 있다.
# python에서는 input 대신 sys.stdin.readline을 사용하는 것이 좋다. 
# 단, 이때는 맨 끝의 개행문자까지 같이 입력받기 때문에 개행문자를 제거하고 싶다면 .rstrip()을 추가로 해주는 것이 좋다.

# 참고
# rstrip을 하라는 건 문자열 자체를 변수에 저장하고 싶을 때 얘기지, 개행문자가 맨 끝에 들어와도 int 변환이나 split()을 그대로 할 수 있습니다. 
# 즉 int(sys.stdin.readline()), sys.stdin.readline().split() 이렇게 해도 아무 문제 없습니다. 
# 참고로 이름이 꽤 길기 때문에 저는 input = sys.stdin.readline()을 맨 처음에 함으로써 쓰는 편입니다.

import sys

input = sys.stdin.readline
print = sys.stdout.write

n = int(input())

for i in range(n):
    a, b = map(int, input().split())
    print("%d" %(a+b))
    print("\n")