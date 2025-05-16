import Foundation

/**
1. 인접 리스트 만들기
2. bfs로 최단거리 구하기
끗
*/

/// n: 부대가 위치한 지역 수, roads: 두 지역 왕복 길, source: 부대가 위치한 지역, destination: 강철부대의 지역
/// returns: 주어진 sources 원소 순서대로 부대로 복귀가능한 최단시간
func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    var adjList = [Int: [Int]]()

    // 인접 리스트 만들기
    for road in roads {
        let (u, v) = (road[0], road[1])
        adjList[u, default: []].append(v)
        adjList[v, default: []].append(u)
    }
    
    // bfs로 최단거리 구하기
    let totalDistance = bfs(n, adjList, sources, destination)
    // sources에 있는 것만 추출
    let result = sources.map { totalDistance[$0] }

    return result
}

func bfs(_ n: Int, _ adjList: [Int: [Int]], _ sources: [Int], _ destination: Int) -> [Int] {
    var queue = [Int]()
    var queueIdx = 0 
    var dist = Array(repeating: -1, count: n + 1)
    
    queue.append(destination)
    dist[destination] = 0
    
    while queueIdx < queue.count {
        let cur = queue[queueIdx]
        queueIdx += 1
        
        for next in adjList[cur, default: []] {
            guard dist[next] == -1 else { continue }
            queue.append(next)
            dist[next] = dist[cur] + 1
        }
    }
    
    return dist
}