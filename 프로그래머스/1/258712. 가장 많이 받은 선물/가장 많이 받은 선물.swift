import Foundation
/**
선물 주고받은 기록 -> 다음달 누가 선물을 많이 받을 지
입력: friends: 친구들 전체 목록, gifts: 선물 주고받은 기록
출력: 다음달 가장 많은 선물을 받는 친구가 받을 선물의 수

규칙:
1) 선물 주고 받은 기록 존재 -> 선물 더 많이 준 사람이 다음 달에 선물 하나 받음.
2) 선물 주고 받은 기록 x || 주고 받은 수 같음 -> 선물 지수 큰 사람이 하나 받음
    - 선물 지수: 자신이 친구들에게 준 선물의 수 - 받은 선물의 수
    - 선물 지수까지 같으면 선물 주고받지 않음.
*/
var receivedGiftDict = [String: Int]() // 자신이 받은 선물 총 개수
var gaveGiftDict = [String: Int]() // 자신이 준 선물 총 개수

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    // 자료구조
    // - giftLogDict: 누가 누구에게 선물을 얼마나 받았는지 기록하기 위함.
    // - received/gaveGiftDict: 선물 지수 개산 및 결과 반환 할 때, 탐색하는 시간을 줄이기 위해 딕셔너리 사용
    var giftLogDict = [String: Int]() // [(받은사람, 준사람), 받은 개수]
    var upcomingGifts = [String: Int]() // 다음 달에 받을 선물의 개수
    
    for gift in gifts {
        let (giver, receiver) = parseGiftLog(gift)
        giftLogDict["\(receiver) \(giver)", default: 0] += 1
        receivedGiftDict[receiver, default: 0] += 1
        gaveGiftDict[giver, default: 0] += 1
    }
    
    for i in 0..<friends.count {
        for j in i..<friends.count {
            let a = friends[i]
            let b = friends[j]
            // a가 b에게 받은 개수 > b가 a에게 받은 개수 -> b가 더 많이 줬다
            if giftLogDict["\(a) \(b)", default: 0] > giftLogDict["\(b) \(a)", default: 0] {
                upcomingGifts[b, default: 0] += 1
            } else if giftLogDict["\(b) \(a)", default: 0] > giftLogDict["\(a) \(b)", default: 0] {
                upcomingGifts[a, default: 0] += 1
            } else {
                let giftIdxOfA = getGiftIdx(of: a)
                let giftIdxOfB = getGiftIdx(of: b)
                
                if giftIdxOfA > giftIdxOfB {
                    upcomingGifts[a, default: 0] += 1
                } else if giftIdxOfB > giftIdxOfA {
                    upcomingGifts[b, default: 0] += 1
                }
            }
        }
    }
    
    guard let maxUpcomingGiftCount = upcomingGifts.values.max() else { return 0 }
    return maxUpcomingGiftCount
}

func getGiftIdx(of friend: String) -> Int {
    return gaveGiftDict[friend, default: 0] - receivedGiftDict[friend, default: 0]
}

func parseGiftLog(_ log: String) -> (String, String) {
    let components = log.split(separator: " ").map { String($0) }
    return (components[0], components[1])
}