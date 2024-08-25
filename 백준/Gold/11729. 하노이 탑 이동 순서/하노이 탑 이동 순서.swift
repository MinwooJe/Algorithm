var answer = ""
var executeCount = 0

func towerOfHanoi(from: Int, to: Int, temp: Int, count: Int) {
    executeCount += 1
    
    // base condition
    if count == 1 {
        answer += "\(from) \(to)\n"
        return
    }
    towerOfHanoi(from: from, to: temp, temp: to, count: count - 1)
    answer += "\(from) \(to)\n"
    towerOfHanoi(from: temp, to: to, temp: from, count: count - 1)
}

if let plateCount = readLine() {
    towerOfHanoi(from: 1, to: 3, temp: 2, count: Int(plateCount)!)
    print(executeCount)
    print(answer)
}