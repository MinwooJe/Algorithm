/**
10진수: 0 / 1 / 2 / 3 / 4 / 5 / 6 / 7 / 8 / 9 / 1, 0 / 1, 1 / 1, 2 / 1, 3 / 1, 4 / …
2진수: 0 / 1 / 1, 0 / 1, 1 / 1, 0, 0 / 1, 0, 1 / 1, 1, 0 / 1, 1, 1 / …

t에 따라 숫자 배열 구하기
p - 1 번째 수 부터 m칸씩 건너뛰면서 구하기 -> t개까지
*/
/// - Parameters: n: 진법, t: 미리 구할 숫자 개수, m: 게임에 참가하는 인원, p: 튜브의 순서
/// - Return Value: 튜브가 말해야하는 숫자 개수 t개를 공백없이 리턴.
///   단, 10~15는 A~F로 출력
func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    let numbers = getNumbers(n, m * t)
    var result = ""
    
    for i in stride(from: p - 1, to: m * t, by: m) {
        result += String(numbers[i])
    }
    
    return result
}

func getNumbers(_ base: Int, _ end: Int) -> [String] {
    var result = [String]()
    
    for i in 0...end {
        let num = String(i, radix: base)
        result += String(i, radix: base).map { String($0.uppercased()) }
    }

    return result
}