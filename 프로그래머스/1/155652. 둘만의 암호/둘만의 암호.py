def solution(s, skip, index):
    answer = []
    alphabet = [chr(i) for i in range(97, 123)]
    for c in skip:
        alphabet.remove(c)

    for c in s:
        idx = (alphabet.index(c) + index) % len(alphabet)
        answer.append(alphabet[idx])
    
    answer = ''.join(answer)
    
    return answer