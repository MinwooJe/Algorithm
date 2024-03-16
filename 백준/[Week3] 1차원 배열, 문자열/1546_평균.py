n = int(input())
score = list(map(int, input().split()))

max_score = max(score)

for i in range(len(score)):
    score[i] = score[i]/max_score*100

print(sum(score) / len(score))


# 이 코드를 작성하면 Python에서는 오류가 발생하지 않지만, 예상대로 작동하지 않습니다. 이유는 for 루프 내에서 i는 score 리스트의 각 요소의 복사본이기 때문입니다.
# 즉, i = i/max_score*100 이라는 코드는 i라는 임시 변수의 값을 변경하지만, 원래의 리스트 score는 변경되지 않습니다. 그래서 이 코드를 실행한 후에도 score 리스트는 원래의 상태를 유지하게 됩니다.
# 원래의 리스트를 변경하려면, 각 요소에 인덱스를 사용하여 직접 접근해야 합니다. 아래와 같이 코드를 수정할 수 있습니다: