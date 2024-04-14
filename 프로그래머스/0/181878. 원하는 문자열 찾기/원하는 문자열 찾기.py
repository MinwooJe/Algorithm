def solution(myString, pat):
    answer = 0
    
    myString = myString.lower()
    pat = pat.lower()
    
    if len(pat) > len(myString):
        return 0
    else:
        if pat in myString:
            return 1
        
        
    return answer