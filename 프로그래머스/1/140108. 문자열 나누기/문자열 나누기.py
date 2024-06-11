def solution(s):
    answer = 0
    same, not_same = 0, 0
    for c in s:
        if same == not_same:
            answer += 1
            same, not_same = 0, 0
            x = c
            
        if x == c:
            same += 1
        elif x != c:
            not_same += 1
            
    return answer