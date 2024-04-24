def solution(A, B):
    answer = 0
    l = len(A)
    new = ''
    check = [A]
    
    for i in range(l-1):
        new = A[l-i-1:] + A[:l-i-1]
        check.append(new)

    if B in check:
        answer = check.index(B)
    else:
        answer = -1
    return answer