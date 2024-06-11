def solution(s):
    char_hash = {}
    answer = []
    for i in range(len(s)):
        if s[i] in char_hash:
            answer.append(i - char_hash[s[i]])
        else:
            answer.append(-1)
        char_hash[s[i]] = i
    return answer
    