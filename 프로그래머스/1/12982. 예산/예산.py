def solution(d, budget):
    d.sort()
    i = 0
    while i < len(d) and budget - d[i] >= 0:
        budget -= d[i]
        i += 1
    return i