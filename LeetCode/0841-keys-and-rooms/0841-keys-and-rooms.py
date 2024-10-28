from collections import deque
class Solution:
    def canVisitAllRooms(self, rooms: List[List[int]]) -> bool:
        visited = {0: True}
        
        q = deque()
        q.append(rooms[0])
        
        while q:
            cur_keys = q.popleft()
            for key in cur_keys:
                if key not in visited:
                    visited[key] = True
                    q.append(rooms[key])

        return len(visited) == len(rooms)