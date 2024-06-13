def solution(new_id):
    # 1단계
    new_id = new_id.lower()
    # 2단계
    removed_special = ''
    for i in new_id:
        if i.isdigit() or i.isalpha() or i in ['-', '_', '.']:
            removed_special += i
    new_id = removed_special
    # 3단계
    stack = []
    for i in new_id:
        stack.append(i)
        if len(stack) > 1 and stack[-1] == '.' and stack[-2] == '.':
            stack.pop()
    new_id = ''.join(stack)
    # 4단계
    if len(new_id) > 0 and new_id[0] == '.':
        new_id = new_id[1:]
    if len(new_id) > 0 and new_id[-1] == '.':
        new_id = new_id[:-1]
    # 5단계
    if not new_id:
        new_id += 'a'
    # 6단계
    if len(new_id) >= 16:
        new_id = new_id[:15]
        if new_id[-1] == '.':
            new_id = new_id[:14]
    # 7단계
    padded_char = new_id[-1]
    while len(new_id) < 3:
        new_id += padded_char
    
    return new_id