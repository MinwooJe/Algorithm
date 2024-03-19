s = input()
alphabet_list = ['c=', 'c-', 'dz=', 'd-', 'lj', 'nj', 's=', 'z=']

result = 0

for i in range(len(alphabet_list)):
    while alphabet_list[i] in s:
        result += 1
        s = s.replace(alphabet_list[i], ' ', 1)

s = s.replace(' ', '')
result += len(s)
print(result)

# 다른 사람 풀이 - 그냥 여러 문자를 한글자짜리로 변환해버리기..
s = input()
alphabet_list = ['c=', 'c-', 'dz=', 'd-', 'lj', 'nj', 's=', 'z=']

for i in alphabet_list:
    s=s.replace(i, '*')
print(len(s))