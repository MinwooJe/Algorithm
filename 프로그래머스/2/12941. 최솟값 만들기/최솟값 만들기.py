def solution(A,B):
    answer = 0
    n = min(len(A), len(B))
    A.sort()
    B.sort(reverse=True)
    
    for i in range(n):
        answer += A[i] * B[i]
    return answer