def solution(arr):
    answer = []
    for i in range(len(arr)-1):
        if arr[i] != arr[i+1]:
            answer.append(arr[i])
        if i == len(arr) - 2:
                answer.append(arr[-1])
    return answer