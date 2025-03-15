import Foundation
/**
1. 입차 후 출차내역 없으면, 23:59에 나간 것.
2. 누적 시간이 기본 시간 이하 -> 기본 요금 청구
3. 초과한 시간이 단위 시간으로 나누어떨어지지 않으면 올림
4. 잘못된 입력 없음: 들어오지 않았는데 나가는 경우
*/

/**
[차량번호]
[차량번호: 입차시간]
[차량번호: 누적시간]

records 순회 
    IN -> 입차시간 초기화
    OUT -> 딕셔너리 이용해 시간 계산 -> 누적시간 딕셔너리 갱신 -> 입차 딕셔너리 nil
함수: 파싱, 금액 판단
*/

// 차량 번호가 작은 자동차부터 청구할 요금 return
// fees: [기본 시간, 기본 요금, 단위 시간, 단위 요금]
func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var inTimeDict = [String: Int]()
    var totalTimeDict = [String: Int]()
    var result = [Int]()
    
    for record in records {
        let (time, car, isIn) = parse(record)
        if isIn {
            inTimeDict[car] = time
        } else {
            let duringTime = time - inTimeDict[car]!
            totalTimeDict[car, default: 0] += duringTime
            inTimeDict[car] = nil
        }
    }

    for (car, inTime) in inTimeDict {
        totalTimeDict[car, default: 0] += parseToTime("23:59") - inTime
    }

    for car in totalTimeDict.keys.sorted() {
        let totalTime = totalTimeDict[car]!
        result.append(calculateFee(totalTime, fees))
    }
    
    return result
}

func parse(_ str: String) -> (time: Int, car: String, isIn: Bool) {
    let components = str.components(separatedBy: " ")
    let (time, car, enter) = (components[0], components[1], components[2])
    
    return (parseToTime(time), car, enter == "IN")
}

func parseToTime(_ time: String) -> Int {
    let components = time.components(separatedBy: ":")
    let (hour, minute) = (Int(components[0])!, Int(components[1])!)
    
    return hour * 60 + minute
}

// fees: [기본 시간, 기본 요금, 단위 시간, 단위 요금]
func calculateFee(_ time: Int, _ fees: [Int]) -> Int {
    var fee = fees[1]
    
    if time > fees[0] {
        let additionalTime = (time - fees[0])
        fee += fees[3] * ((additionalTime - 1) / fees[2] + 1)
    }
    
    return fee
}