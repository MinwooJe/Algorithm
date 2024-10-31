def solution(s):
    arr = list(s)
    index = 0
    
    for i in range(len(arr)):
        if arr[i] == ' ':
            index = 0
            continue
        if index % 2 == 0:
            arr[i] = arr[i].upper()
        else:
            arr[i] = arr[i].lower()
        index += 1
    return ''.join(arr)