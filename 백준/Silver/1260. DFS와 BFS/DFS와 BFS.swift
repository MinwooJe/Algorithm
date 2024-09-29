let components = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, start) = (components[0], components[1], components[2])
var adjList = Array(repeating: [Int](), count: n + 1)

var dfsVisited = Array(repeating: false, count: n + 1)
var dfsResult = [Int]()
var bfsVisited = Array(repeating: false, count: n + 1)
var bfsResult = [Int]()

for _ in 0..<m {
    let components = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v) = (components[0], components[1])
    adjList[u].append(v)
    adjList[v].append(u)
}

func dfs(_ n: Int) {
    guard dfsVisited[n] == false else { return }
    
    dfsVisited[n] = true
    dfsResult.append(n)
    for node in adjList[n].sorted() {
        dfs(node)
    }
}

func bfs(_ n: Int) {
    var queue = [Int]()
    queue.append(n)
    bfsVisited[n] = true
    
    while !queue.isEmpty {
        let curNode = queue.removeFirst()
        bfsResult.append(curNode)

        let nextNodes = adjList[curNode]
        for node in nextNodes.sorted() {
            if bfsVisited[node] == false {
                // 큐에 넣는 것과 visted 체크는 같이 일어나야 함.
                // 안그러면 큐에 계속 들어감.
                queue.append(node)
                bfsVisited[node] = true
            }
        }
    }
}

dfs(start)
bfs(start)

dfsResult.forEach { print($0, terminator: " ") }
print("")
bfsResult.forEach { print($0, terminator: " ") }
