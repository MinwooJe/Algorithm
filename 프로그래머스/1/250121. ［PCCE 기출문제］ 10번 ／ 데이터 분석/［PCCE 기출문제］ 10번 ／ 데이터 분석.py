def solution(data, ext, val_ext, sort_by):
    ext_mapping = {'code':0, 'date':1, 'maximum':2, 'remain':3}
    filtered_data = filtering_data(data, ext, val_ext, ext_mapping)
    answer = sorted(filtered_data, key=lambda x: x[ext_mapping[sort_by]])
    return answer

def filtering_data(data, ext, val_ext, ext_mapping):
    filtered_data = []
    for d in data:
        if d[ext_mapping[ext]] < val_ext:
            filtered_data.append(d)
    return filtered_data
    
