def solution(ingredient):
    stack = []
    answer = 0

    for i in ingredient:
        stack.append(i)
        if stack[-4:] == [1, 2, 3, 1]:
            stack.pop()
            stack.pop()
            stack.pop()
            stack.pop()
            answer += 1
    return answer