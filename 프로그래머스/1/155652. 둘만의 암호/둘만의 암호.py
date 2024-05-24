def solution(s, skip, index):
    answer = ''
    s, skip = list(s), list(skip)
    crypto_list = [chr(i) for i in range(97, 123)]
    for i in skip:
        if i in crypto_list:
            crypto_list.remove(i)
            
    for i in range(len(s)):
        idx = (crypto_list.index(s[i]) + index) % len(crypto_list)
        s[i] = crypto_list[idx]
    
    return ''.join(s)