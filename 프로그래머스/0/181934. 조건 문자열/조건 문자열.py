def solution(ineq, eq, n, m):
    answer = int(eval('n' + ineq + eq.replace('!', '') + 'm'))
    return answer