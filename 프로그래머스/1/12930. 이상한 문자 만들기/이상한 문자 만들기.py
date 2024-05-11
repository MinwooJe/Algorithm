def solution(s):
    s = s.split(' ')
    new_string = ''
    for i in range(len(s)):
        for idx, value in enumerate(s[i]):
            if idx % 2 == 0:
                new_string += value.upper()
            else:
                new_string += value.lower()
        s[i] = new_string
        new_string = ''
    answer = ' '.join(s)
    return answer