let count = Int(readLine()!)!
let iterCount = Int(readLine()!)!
var adjList = Array(repeating: [Int](), count: count + 1)
var visited = Array(repeating: false, count: count + 1)

var result = 0

// 인접 리스트 만들기
for _ in 0..<iterCount {
    let components = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v) = (components[0], components[1])
    adjList[u].append(v)
    adjList[v].append(u)
}

func dfs(_ n: Int) {
    guard visited[n] == false else { return }
    
    visited[n] = true
    result += 1
    for node in adjList[n] {
        dfs(node)
    }
}

dfs(1)
print(result - 1)
