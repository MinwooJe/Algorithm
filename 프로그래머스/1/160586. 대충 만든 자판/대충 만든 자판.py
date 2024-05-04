def solution(keymap, targets):
    answer = []
    hash = {}
    
    for key in keymap:
        for i, char in enumerate(key):
            if char in hash:
                hash[char] = min(i + 1, hash[char])
            else:
                hash[char] = i + 1
                
    for i, target in enumerate(targets):
        ret = 0
        for char in target:
            if char not in hash:
                ret = -1
                break
            ret += hash[char]
        answer.append(ret)
    
    return answer