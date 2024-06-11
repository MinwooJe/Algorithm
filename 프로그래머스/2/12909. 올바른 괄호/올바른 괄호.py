def solution(s):
    stack = []
    for c in s:
        if c == '(':
            stack.append(')')
        elif c == ')' and not stack:
            return False
        elif c == ')' and stack:
            stack.pop()
    return not stack