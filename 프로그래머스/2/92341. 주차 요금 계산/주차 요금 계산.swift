import Foundation

/**
fees[0]: 기본 시간, fees[1]: 기본 요금
fees[2]: 단위 시간, fees[3]: 단위 요금 -> 올림
records: 시간 기준 오름차순
입차 후 출차기록 없으면 23:59에 출차한 것.
fees: [180, 5000, 10, 600]
records: ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]
*/
var inOutRecord = [Int: [Int]]()
var totalParkingTime = [Int: Int]()

/**
records 순회 -> 파싱
자료구조: 딕셔너리 두 개 이용
[차량번호: [입차, 출차, 입차, 출차, ...]] -> 짝수번째 인덱스가 입차, 홀수가 출차
value의 개수가 홀수면 23:59에 출차 한 것.
-> [차량 번호: 총 시간] 딕셔너리 생성
-> result 배열에 요금 계산
*/
func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var result = [Int]()
    for record in records {
        let (carNum, time, inOut) = parse(record)
        inOutRecord[carNum, default: []].append(time)
    }
    
    for carNum in inOutRecord.keys {
        totalParkingTime[carNum] = getTotalParkingTime(
            inOutRecord[carNum, default: []]
        )
    }
    print(totalParkingTime)

    for carNum in totalParkingTime.keys.sorted() {
        let fee = getTotalFee(totalParkingTime[carNum, default: 0], fees)
        result.append(fee)
    }
    
    return result
}

func parse(_ record: String) -> (Int, Int, String) {
    let components = record.split(separator: " ")
    return (
        Int(components[1])!,
        convertToMinute(String(components[0])),
        String(components[2])
    )
}

func convertToMinute(_ time: String) -> Int {
    let components = time.split(separator: ":").map { Int($0)! }
    let hour = components[0] * 60
    let minute = components[1]
    return hour + minute
}

func getTotalParkingTime(_ times: [Int]) -> Int {
    var times = times
    var result = 0

    if times.count % 2 != 0 {
        times.append(convertToMinute("23:59"))
    }

    for i in 0..<(times.count / 2) {
        result += times[2 * i + 1] - times[2 * i]
    }

    return result
}

func getTotalFee(_ time: Int, _ fees: [Int]) -> Int {
    var time = time
    guard time - fees[0] > 0 else { return fees[1] }
    
    let basicFee = fees[1]
    time -= fees[0]

    let unitFee = (((time - 1) / fees[2]) + 1) * fees[3]

    return basicFee + unitFee
}