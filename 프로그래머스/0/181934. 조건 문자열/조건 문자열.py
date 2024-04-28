def solution(ineq, eq, n, m):
    answer = int(eval(str(n) + ineq + eq.replace('!', '') + str(m)))
    return answer

