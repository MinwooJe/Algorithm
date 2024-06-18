def solution(s):
    stack = []
    
    for c in s:
        if c == '(':
            stack.append('(')
        elif not stack and c == ')':
            return False
        else:
            stack.pop()
    
    if not stack:
        return True
    else:
        return False