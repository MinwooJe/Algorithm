import Foundation

func solution(_ n:Int, _ edges:[[Int]]) -> Int {
    var adjList = Array(repeating: [Int](), count: n + 1)
    var visited = Array(repeating: -1, count: n + 1)
    var maxDepth = 0
    
    for edge in edges {
        let u = edge[0]
        let v = edge[1]
        adjList[u].append(v)
        adjList[v].append(u)
    }
    
    var queue = [(1, 0)]
    visited[1] = 0
    
    while !queue.isEmpty {
        let (curNode, curDepth) = queue.removeFirst()
        
        for nextNode in adjList[curNode] {
            if visited[nextNode] == -1 {
                let nextDepth = curDepth + 1
                queue.append((nextNode, nextDepth))
                visited[nextNode] = nextDepth
                maxDepth = max(maxDepth, nextDepth)
            }
        }
    }
    
    return visited.filter { $0 == maxDepth }.count
}
