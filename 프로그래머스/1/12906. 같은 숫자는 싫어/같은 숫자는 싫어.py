def solution(arr):
    stack = [arr[0]]
    
    for a in arr:
        if stack[-1] != a:
            stack.append(a)
    
    return stack