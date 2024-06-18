def solution(s):
    s = list(s)
    count = 0
    
    for i in range(len(s)):
        print(s[i], count)
        if s[i] == ' ':
            count = 0
        elif s[i].isalpha() and count == 0:
            s[i] = s[i].upper()
            count += 1
        elif s[i].isalpha() and count != 0:
            s[i] = s[i].lower()
        else:
            count += 1
            
    return ''.join(s)