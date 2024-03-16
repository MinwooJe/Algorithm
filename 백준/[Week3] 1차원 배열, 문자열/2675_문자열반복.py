# 첫 번째 풀이
# n = int(input())
# for i in range(n):
#     r, s = map(str, input().split())
#     for j in range(len(s)):
#         for k in range(int(r)):
#             print(s[j], end='')
#     print("")

# 두 번째 풀이
n = int(input())
for i in range(n):
    r, s = input().split()
    for j in s:
        print(j*int(r), end="")
    print()