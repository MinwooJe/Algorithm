def solution(keymap, targets):
    key_hash = {}
    answer = []
    # 딕셔너리 초기화
    for key in keymap:
        for idx, c in enumerate(key):
            if c in key_hash:
                key_hash[c] = min(idx+1, key_hash[c])
            else:
                key_hash[c] = idx + 1
    
    # targets 만들기
    for target in targets:
        count = 0
        for c in target:
            if c not in key_hash:
                count = -1
                break
            else:
                count += key_hash[c]
        answer.append(count)
        
    return answer