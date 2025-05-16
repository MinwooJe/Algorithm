let input = readLine()!.split(separator: " ").map { Int($0)! }
let (inputCount, dnaLength) = (input[0], input[1])
var dna = [[Character]]()
var resultDNA = ""
var resultDistance = 0

for _ in 0..<inputCount {
    let input = readLine()!.map { $0 }
    dna.append(input)
}

for i in 0..<dnaLength {
    var distance = [Character: Int]()
    
    for j in 0..<dna.count {
        let first = dna[j][i]
        distance[first, default: 0] += 1
    }
    
    let minDNA = distance
        .sorted(by: { $0.key < $1.key} )        // key를 오름차순으로 정렬
        .max(by: { $0.value < $1.value })!      // 최댓값 뽑기 ( 비교 기준이 "<"이므로 같은 값이 여러개라면 사전 순으로 앞 선 문자를 반환함.)

    resultDNA.append(minDNA.key)
    resultDistance += (inputCount - minDNA.value)
}

print(resultDNA)
print(resultDistance)
