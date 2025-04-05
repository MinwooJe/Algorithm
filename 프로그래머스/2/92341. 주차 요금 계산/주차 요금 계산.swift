import Foundation

/**
1. 차량 번호 별 총 주차 시간 집계
    - records를 순회
    - 파싱
    - IN이면 입차시간 기록, OUT이면 주차 시간 계산 후 nil, 총 주차시간 저장 -> 자료구조 두 개 필요: 해시
    - 출차하지 않은 차량번호 체크
2. 시간을 요금으로 변환
3. "차량 번호가 작은"순으로 요금 리턴
*/
/// fees: [기본 시간, 기본 요금, 단위 시간, 단위 요금], records[k] = "시각 챠량번호 내역"
func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var entryTimes = [String: Int]()  // [차량번호: 입차 시간]
    var parkingTimes = [String: Int]() // [차량번호: 누적 시간]
    var parkingFee = [String: Int]()   // [차량번호: 누적 요금]
    var result = [Int]()
    
    for record in records {
        let (time, carNum, isIn) = parseRecords(record)
        if isIn {
            entryTimes[carNum, default: 0] = time
        } else {
            let entryTime = entryTimes[carNum]!
            parkingTimes[carNum, default: 0] += time - entryTime
            entryTimes[carNum] = nil
        }
    }
    
    for (carNum, time) in entryTimes {
        parkingTimes[carNum, default: 0] += parseToMinute("23:59") - time
    }
    
    for (carNum, time) in parkingTimes {
        parkingFee[carNum] = calculateFee(fees, time)
    }
    
    result = parkingFee.sorted { $0.key < $1.key }.map { $0.value }

    return result
}

func parseRecords(_ str: String) -> (Int, String, Bool) {
    let components = str.components(separatedBy: " ")
    let time = parseToMinute(components[0])
    let carNum = components[1]
    let isIn = components[2] == "IN" ? true : false

    return (time, carNum, isIn)
}

func parseToMinute(_ str: String) -> Int {
    let components = str.components(separatedBy: ":")
    let hour = Int(components[0])!
    let minute = Int(components[1])!
    
    return hour * 60 + minute
}

/// fees: [기본 시간, 기본 요금, 단위 시간, 단위 요금]
func calculateFee(_ fees: [Int], _ parkingTime: Int) -> Int {
    if parkingTime <= fees[0] {
        return fees[1]
    } else {
        return fees[1] + ((parkingTime - fees[0] - 1) / fees[2] + 1) * fees[3]
    }
}