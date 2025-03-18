let input = readLine()!.split(separator: " ").map { Int($0)! }
let (player, target) = (input[0], input[1])
let diff = [-1, 1, 2]

var board = Array(repeating: -1, count: 100001)
var visited = Array(repeating: -1, count: 100001)
var queue = [Int]()
queue.append(player)
visited[player] = 0

var queueIdx = 0
while queueIdx < queue.count {
    let curr = queue[queueIdx]
    queueIdx += 1
    
    if curr == target {
        print(visited[curr])
        break
    }
    
    for next in [curr - 1, curr + 1, curr * 2] {
        if next < 0 || next > 100000 { continue }
        if visited[next] != -1 { continue }
        queue.append(next)
        visited[next] = visited[curr] + 1
    }
}

