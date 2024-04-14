def solution(my_string):
    answer = [0 for i in range(52)]
    
    for i in range(26):
        for s in my_string:
            if chr(i+65) == s:
                answer[i] += 1
    for i in range(26):
        for s in my_string:
            if chr(i+97) == s:
                answer[i+26] += 1
                
    return answer

[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,0,2,0,1,0,0,3,1,0,0,0,0,0,0,0]
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,2,0,1,0,0,3,1,0,0,0,0,0,0,0]