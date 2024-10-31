n = int(input())
grid = [
    list(map(int, input().split()))
    for _ in range(n)
]

memo = {}
def dp(row, col):
    if row == 0 and col == 0:
        return grid[row][col]
    
    if (row, col) not in memo:
        if row-1 >= 0 and col-1 >= 0:
            memo[(row, col)] = min(grid[row][col], max(dp(row-1, col), dp(row, col-1)))
        elif row-1 >= 0:
            memo[(row, col)] = min(grid[row][col], dp(row-1, col))
        elif col-1 >= 0:
            memo[(row, col)] = min(grid[row][col], dp(row, col-1))
    
    return memo[(row, col)]

print(dp(n-1, n-1))