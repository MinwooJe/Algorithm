def solution(keymap, targets):
    answer = []
    key_hash = {}
    for key in keymap:
        for idx, k in enumerate(key):
            idx += 1
            if k not in key_hash:
                key_hash[k] = idx
            else:
                key_hash[k] = min(idx, key_hash[k])
    
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