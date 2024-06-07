def solution(wallpaper):
    answer = [] 
    row, col = [], []
    for i in range(len(wallpaper)):
        for j in range(len(wallpaper[i])):
            if wallpaper[i][j] == '#':
                col.append(j)
                row.append(i)

    answer = [min(row), min(col), max(row)+1, max(col)+1]
    return answer
 