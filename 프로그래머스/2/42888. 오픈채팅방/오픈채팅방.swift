import Foundation
/**
자료구조
userName = [uid: 닉네임]
log = [(uid, op)]

record 순회
userName 갱신
log에 기록

log 순회 -> result 생성
*/
var userName = [String: String]()
let operationMessage = ["Enter": "들어왔습니다.", "Leave": "나갔습니다."]

func solution(_ record:[String]) -> [String] {
    var log = [(uid: String, op: String)]()
    var result = [String]()

    for r in record {
        let arr = parse(r)

        if arr.count == 2 {
            log.append((arr[1], arr[0]))
        } else if arr[0] == "Change" {
            userName[arr[1]] = arr[2]
        } else if arr[0] == "Enter" {
            userName[arr[1]] = arr[2]
            log.append((arr[1], arr[0]))
        }
    }

    for (uid, op) in log {
        result.append(convertToMessage(uid, op))
    }

    return result
}

func parse(_ str: String) -> [String] {
    return str.components(separatedBy: " ")
}

func convertToMessage(_ uid: String, _ op: String) -> String {
    let nickName = userName[uid, default: ""]
    let message = operationMessage[op, default: ""]
    return "\(nickName)님이 \(message)"
}