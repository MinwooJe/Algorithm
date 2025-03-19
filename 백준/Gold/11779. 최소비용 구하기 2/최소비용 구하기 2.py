from collections import defaultdict
import sys, heapq

input = sys.stdin.readline
INF = int(1e9)

# 도시: 정점, 버스: 간선
city_count = int(input())
bus_count = int(input())
graph = defaultdict(list)

for _ in range(bus_count):
    city, bus, cost = map(int, input().split())
    graph[city].append((cost, bus))


start_city, end_city = map(int, input().split())

dist = [INF] * (city_count + 1)
prev_city = [-1] * (city_count + 1)
pq = []

dist[start_city] = 0
heapq.heappush(pq, (0, start_city))

while pq:
    cur_d, cur_v = heapq.heappop(pq)
    
    if dist[cur_v] != cur_d: continue
    
    for next_d, next_v in graph[cur_v]:
        total_d = cur_d + next_d
        if dist[next_v] <= total_d: continue
        heapq.heappush(pq, (total_d, next_v))
        dist[next_v] = total_d
        prev_city[next_v] = cur_v

path = [end_city]
now = end_city
while now != start_city:
    now = prev_city[now]
    path.append(now)
path.reverse()

print(dist[end_city])
print(len(path))
print(" ".join(map(str, path)))