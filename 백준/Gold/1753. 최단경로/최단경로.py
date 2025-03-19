from collections import defaultdict
import heapq
import sys
input = sys.stdin.readline

vCount, eCount = map(int, input().split())
startNode = int(input())
graph = defaultdict(list)
INF = 300001
for i in range(eCount):
    start, end, weight = map(int, input().split())
    graph[start].append((weight, end))

def dijkstra(graph, start):
    costs = [INF] * (vCount + 1)
    costs[start] = 0
    pq = []
    heapq.heappush(pq, (0, start))
    
    while pq:
        cur_cost, cur_v = heapq.heappop(pq)
        
        if costs[cur_v] < cur_cost:
            continue
        
        for cost, next_v in graph[cur_v]:
            next_cost = cur_cost + cost
            
            if next_cost < costs[next_v]:
                costs[next_v] = next_cost
                heapq.heappush(pq, (next_cost, next_v))
    
    return costs

costs = dijkstra(graph, startNode)

for v in range(1, vCount + 1):
    if costs[v] == INF:
        print("INF")
    else:
        print(costs[v])