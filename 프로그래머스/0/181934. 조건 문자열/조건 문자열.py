def solution(ineq, eq, n, m):
    answer = 0
    if ineq == '>' and eq == '=':
        if n >= m:
            return 1
        else:
            return 0
    elif ineq == '>' and eq == '!':
        if n > m:
            return 1
        else:
            return 0
    elif ineq == '<' and eq == '=':
        if n <= m:
            return 1
        else:
            return 0
    else:
        if n < m:
            return 1
        else:
            return 0
    return answer