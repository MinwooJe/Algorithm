def solution(s, skip, index):
    answer = ''
    char_list = [chr(i+97) for i in range(26)]
    for c in skip:
        char_list.remove(c)
    
    for c in s:
        idx = (char_list.index(c) + index) % len(char_list)
        answer += char_list[idx]
        print('c의 인덱스, idx', char_list.index(c), idx)

    return answer