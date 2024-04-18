def solution(strArr):
    d = {}
    for s in strArr:
        d[len(s)] = d.get(len(s), 0) + 1
    answer = max(d.values())
    return answer
