def solution(dartResult):
    score = []
    dartResult = dartResult.replace('10', 't')
    for i in dartResult:
        if i.isnumeric():
            score.append(int(i))
        elif i == "t":
            score.append(10)
        elif i == "S":
            score[-1] **= 1
        elif i == "D":
            score[-1] **= 2
        elif i == "T":
            score[-1] **= 3
        elif i == "*":
            if len(score) > 1:
                score[-1] *= 2
                score[-2] *= 2
            else:
                score[-1] *= 2
        elif i == "#":
            score[-1] *= -1
    answer = sum(score)
    return answer