def solution(s):
    x = s[0]
    count = 0
    same, not_same = 0, 0
    for i in s:
        if same == not_same:
            count += 1
            x = i
        if i == x:
            same += 1
        else:
            not_same += 1
    return count