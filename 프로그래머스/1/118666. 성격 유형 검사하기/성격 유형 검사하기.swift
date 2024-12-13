import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var testResult: [Character: Int] = [
        "R": 0, "T": 0, "C": 0, "F": 0,
        "J": 0, "M": 0, "A": 0, "N": 0
    ]

    for (s, c) in zip(survey, choices) {
        let point = getPoint(of: c)
        if c < 4 {  // 비동의 - 앞 캐릭터
            testResult[s.first!, default: 0] += point
        } else if c > 4 {  // 동의 - 뒤 캐릭터
            testResult[s.last!, default: 0] += point
        }
    }
    
    return getResult(of: testResult)
}

func getPoint(of choice: Int) -> Int {
    return choice <= 4 ? 4 - choice : choice - 4
}

func getResult(of testResult: [Character: Int]) -> String {
    var result = ""
    print(testResult)
    result += testResult["R"]! >= testResult["T"]! ? "R" : "T"
    result += testResult["C"]! >= testResult["F"]! ? "C" : "F"
    result += testResult["J"]! >= testResult["M"]! ? "J" : "M"
    result += testResult["A"]! >= testResult["N"]! ? "A" : "N"
    
    return result
}
