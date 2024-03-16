n = int(input())
s_list = []
result = 0
for i in range(n):
    s = input()

    # 입력 받은 문자열의 순서와 동일하고 중복을 제거한 리스트
    # happy -> ['h', 'a', 'p', 'y']
    for j in s:
        if j not in s_list:
            s_list.append(j)

    # s_list는 입력 받은 문자열과 순서가 같으므로 lstrip을 이용해 문자열을 쭉 제거
    for k in s_list:
        s = s.lstrip(k)
    s_list.clear()

    # 문자열의 길이가 0이라는 것은 똑같은 문자가 떨어져서 나타나지 않은 그룹단어이므로 카운팅하기
    if len(s) == 0:
        result +=1
print(result)