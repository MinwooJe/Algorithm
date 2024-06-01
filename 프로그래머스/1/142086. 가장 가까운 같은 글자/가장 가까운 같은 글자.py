def solution(s):
    latest_char_idx = {}
    answer = []
    for idx, char in enumerate(s):
        if char in latest_char_idx:
            answer.append(idx - latest_char_idx[char])
        else:
            answer.append(-1)
        latest_char_idx[char] = idx
    return answer