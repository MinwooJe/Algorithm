def solution(s):
    answer = 0

    while len(s) > 0:
        same, not_same = 0, 0
        i = 0
        x = s[0]
        while i < len(s) and (same != not_same or same == 0):
            if x == s[i]:
                same += 1
            else:
                not_same += 1
            i += 1

        s = s[i:]
        answer += 1
    print(s)
    print(answer)
    return answer