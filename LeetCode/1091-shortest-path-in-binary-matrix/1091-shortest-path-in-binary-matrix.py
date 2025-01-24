from collections import deque
"""
방문 가능한 셀은 0, 8방향
비선형 자료구조에다 그래프 형태 -> bfs/dfs
미로찾기 문제이니 dfs를 사용한다면 백트래킹 해야됨.
따라서 bfs가 더 나을 수도
bfs하면 가장 먼저 도착하는 놈이 최단경로가 됨.
시간 복잡도 -> O(셀의개ㅜㅅ) == O(n^2) s.t. 1 <= n <= 100 -> 최악의 경우 10^4이므로 시간복잡도 ㄱㅊㄱㅊ
clear path: 좌상단에서 우하단으로 가는 경로
clear path가 없다면 -1 리턴
clear path가 없는 경우?: 시작점 또는 끝점이 1이거나 말 그대로 경로가 없음.
grid는 정사각
"""
class Solution:
    def shortestPathBinaryMatrix(self, grid: List[List[int]]) -> int:
        gridCount = len(grid)
        delta = [(-1, 0), (1, 0), (0, -1), (0, 1), (1, 1), (1, -1), (-1, 1), (-1, -1)]
        visited = [[False] * gridCount for _ in range(gridCount)]
        max_path_len = -1

        if grid[0][0] == 1 or grid[gridCount-1][gridCount-1] == 1:
            return max_path_len
        
        queue = deque()
        queue.append((0, 0, 1))

        while queue:
            curRow, curCol, cur_path_len = queue.popleft()
            if curRow == gridCount-1 and curCol == gridCount-1:
                max_path_len = cur_path_len
                break

            for i in range(8):
                nextRow = curRow + delta[i][0]
                nextCol = curCol + delta[i][1]
                if nextRow >= 0 and nextRow < gridCount and nextCol >= 0 and nextCol < gridCount:
                    if grid[nextRow][nextCol] == 0 and visited[nextRow][nextCol] == False:
                        queue.append((nextRow, nextCol, cur_path_len + 1))
                        visited[nextRow][nextCol] = True
                        print(nextRow, nextCol)
        return max_path_len