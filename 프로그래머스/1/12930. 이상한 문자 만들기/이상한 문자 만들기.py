def solution(s):
    str_list = s.split(' ')
    temp_word = []
    answer = []
    for word in str_list:
        for i in range(len(word)):
            if i % 2 == 0:
                temp_word.append(word[i].upper())
            else:
                temp_word.append(word[i].lower())
        answer.append(''.join(temp_word))
        temp_word = []
    answer = ' '.join(answer)
    return answer