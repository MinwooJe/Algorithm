// n: 진법, t: 미리 구할 숫자 개수, m: 게임 참가 인원, p: 튜브 순서
func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var totalNumber = ""
    var result = ""
    for num in 0...t*m {
        let str = String(num, radix: n)
        
        totalNumber += String(num, radix: n)
    }
    
    var totalArray = Array(totalNumber)
    
    for i in 0..<t {
        let index = (p - 1) + m * i
        print(index)
        result += String(totalArray[index]).uppercased()
    }
    
    return result
}