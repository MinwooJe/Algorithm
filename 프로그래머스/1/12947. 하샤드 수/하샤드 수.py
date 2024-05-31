def solution(x):
    digit_sum = sum([int(i) for i in list(str(x))])
    if x % digit_sum == 0:
        return True
    else:
        return False