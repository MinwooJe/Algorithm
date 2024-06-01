def solution(data, ext, val_ext, sort_by):    
    ext_dict = {'code':0, 'date':1, 'maximum':2, 'remain':3}
    filtered_data = filtering(data, ext, val_ext)
    sorted_data = sorted(filtered_data, key=lambda x: x[ext_dict[sort_by]])
    return sorted_data
    
def filtering(data, ext, val_ext):
    ext_dict = {'code':0, 'date':1, 'maximum':2, 'remain':3}
    filtered_data = []
    for d in data:
        if d[ext_dict[ext]] < val_ext:
            filtered_data.append(d)
    return filtered_data