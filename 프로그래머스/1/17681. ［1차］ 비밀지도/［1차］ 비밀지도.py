def solution(n, arr1, arr2):
    answer = []
    for i in range(n):
        result = bin(arr1[i] | arr2[i])[2:]
        
        while len(result) < n:
            result = '0' + result
            
        result = result.replace('1', '#')
        result = result.replace('0', ' ')
        
        answer.append(result)
        
    return answer