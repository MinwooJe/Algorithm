n = int(input()) 
grid = [
    list(map(int, input().split()))
    for _ in range(n)
]
memo = {}

# 움직임: 왼쪽(0, -1) == col-1, 밑(1, 0) == row+1
def dp(row, col):
    if row == n-1 and col == 0:
        return grid[row][col]
    
    if (row, col) not in memo:
        if row+1 < n and col-1 >= 0:
            memo[(row, col)] = min(dp(row+1, col), dp(row, col-1))
        elif row+1 < n:
            memo[(row, col)] = dp(row+1, col)
        elif col-1 >= 0:
            memo[(row, col)] = dp(row, col-1)
        memo[(row, col)] += grid[row][col]
    
    return memo[(row, col)]

print(dp(0, n-1))