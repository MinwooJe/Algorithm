n = input()

# a는 아스키코드 97
for i in range(26):
    if chr(97 + i) in n:
        print(n.find(chr(97+i)), end=' ')
    else:
        print(-1, end=' ')