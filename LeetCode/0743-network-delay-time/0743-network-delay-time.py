import heapq

class Solution:
    # n: 노드 개수, times[i] = [ui, vi, wi] -> ui에서 vi로 가는데 wi만큼 걸린다.
    # k: 시작 노드 -> 모든 노드가 신호를 받는데 걸리는 최소 시간 리턴, 불가능하면 -1 리턴
    def networkDelayTime(self, times: List[List[int]], n: int, k: int) -> int:
        graph = defaultdict(list)
        for time in times:
            graph[time[0]].append((time[2], time[1]))

        costs = {}
        pq = []
        heapq.heappush(pq, (0, k))
        print(graph)

        while pq:
            cur_cost, cur_v = heapq.heappop(pq)

            if cur_v not in costs:
                costs[cur_v] = cur_cost
                print(cur_v)
                for cost, next_v in graph[cur_v]:
                    next_cost = cur_cost + cost
                    heapq.heappush(pq, (next_cost, next_v))
        
        if len(costs) == n:
            return max(costs.values())
        else:
            return -1