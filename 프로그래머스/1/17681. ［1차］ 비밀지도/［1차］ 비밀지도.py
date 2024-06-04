def solution(n, arr1, arr2):
    answer = []
    # arr의 각 원소들 꺼내서 2진수 or 연산 -> 새로운 배열 만들기
    for i in range(n):
        answer.append(bin(arr1[i]|arr2[i])[2:])
    # 그 배열의 1을 replace #
    for i in range(n):
        while len(answer[i]) < n:
            answer[i] = ' ' + answer[i]
        answer[i] = answer[i].replace('1', '#')
        answer[i] = answer[i].replace('0', ' ')
        
    return answer