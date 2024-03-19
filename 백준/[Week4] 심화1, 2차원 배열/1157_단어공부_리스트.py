str = input()
str = str.upper()

word = list(set(str))
word.sort()

count = [0 for i in range(len(word))]

# 단어 개수 센 후 count에 기록
for i in str:
    for j in range(len(word)):
        if i == word[j]:
            count[j] += 1

# 최빈 단어가 여러개인지 확인
max = max(count)
result_index = 0        # 최빈 단어의 인덱스를 기억해 출력하기 위해 만든 변수
result_count = 0        # 최빈 단어가 두개 이상인지를 확인하기 위해 만든 변수

for i in range(len(count)):
    if max == count[i]:
        result_index = i
        result_count += 1

if result_count > 1:
    print('?')
elif result_count == 1:
    print(word[result_index])