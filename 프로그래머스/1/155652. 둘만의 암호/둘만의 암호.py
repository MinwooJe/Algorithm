def solution(s, skip, index):
    alphabet = []
    for i in range(26):
        alphabet.append(chr(97+i))
    for i in skip:
        alphabet.remove(i)
    s = list(s)
    for i in range(len(s)):
        idx = alphabet.index(s[i])
        s[i] = alphabet[(idx+index) % len(alphabet)]
    return ''.join(s)