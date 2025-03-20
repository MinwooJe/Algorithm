import Foundation
/**
하루 동안의 누적 주차 시간 계산 -> 요금 일괄 정산
누적 주차 시간 > 기본 시간 -> 기본 요금 + {1 + (누적 주차 시간 - 기본 시간 - 1) / 단위 시간} * 단위요금
차량 번호가 작은 자동차부터 청구할 주차요금 리턴
*/
/**
자료구조
1. enteredTime = [String: Int] = [차량번호: 입차시간]
-> records 순회하며 파싱 -> isIn == true 이면 여기에 저장, false면 꺼내서 total에 저장
2. totalTime = [String: Int] = [차량번호: 누적시간]
로직
totalTime을 다 구한 후 for carNum in totakTime.keys: 
함수
1. HH:MM -> 분으로 바꾸는 함수
2. records 파싱 함수 -> 분, 번호, isIn: Bool 반환
3. total 시간을 금액으로 바꾸는 함수
*/
/// fees = [기본 시간, 기본 요금, 단위 시간, 단위 요금]
/// records = "시각 차량번효 내역"
func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var enteredTime = [String: Int]()
    var totalTime = [String: Int]()
    
    for record in records {
        let (time, carNum, isIn) = parseRecord(record)
        
        if isIn {
            enteredTime[carNum] = time
        } else {
            totalTime[carNum, default: 0] += time - enteredTime[carNum]! 
            enteredTime[carNum] = nil
        }
    }
    
    for (carNum, time) in enteredTime {
        totalTime[carNum, default: 0] += 1439 - enteredTime[carNum]!
    }
    
    print(totalTime)
    return totalTime.keys.sorted().map { convertToFee(totalTime[$0]!, fees) }
}

func parseToMinute(_ time: String) -> Int {
    let components = time.components(separatedBy: ":").map { Int($0)! }
    let (hour, minute) = (components[0], components[1])
    
    return hour * 60 + minute
}

func parseRecord(_ record: String) -> (Int, String, Bool) {
    let components = record.components(separatedBy: " ")
    let time = parseToMinute(components[0])
    let carNum = components[1]
    let isIn = components[2] == "IN" ? true : false
    
    return (time, carNum, isIn)
}

/// fees = [기본 시간, 기본 요금, 단위 시간, 단위 요금]
func convertToFee(_ time: Int, _ fees: [Int]) -> Int {
    if time <= fees[0] {
        return fees[1]
    } else {
        let overTime = time - fees[0]
        let overUnit = 1 + (overTime - 1) / fees[2]
        let totalFee = overUnit * fees[3] + fees[1]
        return totalFee
    }
}