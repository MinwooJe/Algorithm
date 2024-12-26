func solution(_ s:String) -> [Int] {
    var components = [Int: Int]()
    
    s.split { !$0.isNumber }.map { Int(String($0))! }.forEach { components[$0, default: 0] += 1}
    
    return components.sorted { $0.value > $1.value }.map { $0.key }
}

/**
다르게 생각하면, 튜플의 앞쪽 원소는 많이 나옴.
예를 들어 테케 2의 2는 총 네 번 나옴. 4는 한 번 나옴.
따라서 각 숫자가 몇 번 나왔는지 딕셔너리를 이용해 개수를 세고, 값의 내림차순으로 키를 리턴하면 됨.
*/