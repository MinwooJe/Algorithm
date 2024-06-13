def solution(wallpaper):
    lux, luy, rdx, rdy = 100, 100, 0, 0
    for n_row, row in enumerate(wallpaper):
        for n_col, r in enumerate(row):
            if r == '#':
                lux = min(lux, n_row)
                rdx = max(rdx, n_row+1)
                luy = min(luy, n_col)
                rdy = max(rdy, n_col+1)
    
    answer = [lux, luy, rdx, rdy]
    
    return answer