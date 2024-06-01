def solution(s):
    num_hash = {'zero':0, 'one':1, 'two':2, 'three':3, 'four':4, 
                'five':5, 'six':6, 'seven':7, 'eight':8, 'nine':9}
    for char, num in num_hash.items():
        if char in s:
            s = s.replace(char, str(num))
    return int(s)
    