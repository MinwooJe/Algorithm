def solution(data, ext, val_ext, sort_by):
    mapping_col = {'code':0, 'date':1, 'maximum':2, 'remain':3}
    filtered_data = []
    
    for d in data:
        if d[mapping_col[ext]] < val_ext:
            filtered_data.append(d)
    
    filtered_data = sorted(filtered_data, key=lambda x: x[mapping_col[sort_by]])
    
    return filtered_data
    
