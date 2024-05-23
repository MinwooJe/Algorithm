def solution(files):
    answer = []
    splited_file_name = []
    
    for file in files:
        splited_file_name.append(split_file_name(file)) 
        
    splited_file_name.sort(key = lambda x :(x[0].lower(), int(x[1])))
    
    for i in range(len(splited_file_name)):
        splited_file_name[i] = ''.join(splited_file_name[i])
    return splited_file_name

def split_file_name(file):
    head, num, tail = '', '', ''
    for i in range(len(file)):
        if file[i].isdigit() and len(file) > (i+1)and not file[i+1].isdigit():   # tail 검사
            num += file[i]
            tail = file[i+1:]
            break
        elif not file[i].isdigit():     # head 검사
            head += file[i]
        elif file[i].isdigit():         # number 검사
            num += file[i]
    return [head, num, tail]