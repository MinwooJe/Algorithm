def solution(d, budget):
    d.sort()
    answer = 0
    i = 0

    # 인덱스 조건을 먼저 검사하지 않으면 Out of range 에러 발생
    # budget > 0을 하면 한 번 더 카운트 되므로 budget >= d[i]로 검사
    while i < len(d) and budget >= d[i]:
        budget = budget - d[i]
        i += 1
        answer += 1

    return answer