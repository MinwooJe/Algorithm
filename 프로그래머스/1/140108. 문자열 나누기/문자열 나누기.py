def solution(s):
    answer = 0
    while len(s) > 0:
        same, not_same = 0, 0
        x = s[0]
        i = 0
        while i < len(s) and (same != not_same or same == 0):
            if s[i] == x:
                same += 1
            else:
                not_same += 1
            i += 1
        answer += 1
        s = s[i:]
    return answer