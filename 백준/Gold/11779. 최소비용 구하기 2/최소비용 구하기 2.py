from collections import defaultdict
import sys, heapq

input = sys.stdin.readline
INF = int(1e9)
cityCount = int(input())
busCount = int(input())

graph = defaultdict(list)
dist = [INF] * (cityCount + 1)
prev = [-1] * (cityCount + 1)
pq = []

for _ in range(busCount):
    src, des, cost = map(int, input().split())
    graph[src].append((cost, des))
    
start, target = map(int, input().split())

heapq.heappush(pq, (0, start))
dist[start] = 0

while pq:
    cur_d, cur_v = heapq.heappop(pq)
    
    if dist[cur_v] != cur_d: continue
    
    for next_d, next_v in graph[cur_v]:
        total_d = cur_d + next_d
        if total_d >= dist[next_v]: continue
        heapq.heappush(pq, (total_d, next_v))
        dist[next_v] = total_d
        prev[next_v] = cur_v
        
path = [target]
now = target
while now != start:
    now = prev[now]
    path.append(now)
path.reverse()

print(dist[target])
print(len(path))
print(" ".join(map(str, path)))