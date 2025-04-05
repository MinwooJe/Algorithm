/// n: 진법, t: 미리 구할 숫자 개수, m: 게임 참가 인원, p: 튜브 순서
func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var numbers = [Character]()
    var result = ""
    
    for num in 0...(t * m) {
        numbers += Array(String(num, radix: n))
    }

    for i in 0..<t {
        result += String(numbers[i * m + p - 1]).uppercased()
    }

    return result
}