from collections import deque

class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        result = 0
        rowCount = len(grid)
        colCount = len(grid[0])
        visited = [[False] * colCount for _ in range(rowCount)]

        def bfs(row, col):
            dRow = [-1, 1, 0 ,0]
            dCol = [0, 0, -1, 1]
            visited[row][col] = True
            queue = deque()
            queue.append((row, col))

            while queue:
                curRow, curCol = queue.popleft()
                for i in range(4):
                    nextRow = curRow + dRow[i]
                    nextCol = curCol + dCol[i]

                    if nextRow >= 0 and nextRow < rowCount and nextCol >= 0 and nextCol < colCount:
                        if grid[nextRow][nextCol] == '1' and not visited[nextRow][nextCol]:
                            visited[nextRow][nextCol] = True
                            queue.append((nextRow, nextCol))
        
        for i in range(rowCount):
            for j in range(colCount):
                if grid[i][j] == '1' and visited[i][j] == False:
                    bfs(i, j)
                    result += 1
        return result