def solution(keymap, targets):
    key_hash = {}
    answer = []
    for key in keymap:
        for i, v in enumerate(key):
            if v in key_hash:
                key_hash[v] = min(i+1, key_hash[v])
            else:
                key_hash[v] = i+1
    
    for target in targets:
        count = 0
        for t in target:
            if t in key_hash:
                count += key_hash[t]
            else:
                count = -1
                break
        answer.append(count)
    return answer