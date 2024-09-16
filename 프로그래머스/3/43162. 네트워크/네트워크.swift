import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var result = 0
    var adjList = Array(repeating: [Int](), count: computers.count)
    var visited = [Int]()
        
    func bfs(_ com: Int) {
        var queue = [Int]()
        queue.append(com)
        
        while !queue.isEmpty {
            let curCom = queue.removeFirst()
            visited.append(curCom)

            for adjCom in adjList[curCom] {
                if !visited.contains(adjCom) {
                    queue.append(adjCom)
                }
            }
        }
    }
    
    for i in 0..<computers.count {
        for j in 0..<computers[0].count  {
            if computers[i][j] == 1 {
                adjList[i].append(j)
            }
        }
    }
    
    for i in 0..<adjList.count {
        if !visited.contains(i) {
            bfs(i)
            result += 1
        }
    }

    return result
}
