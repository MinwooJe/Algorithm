/** 단순 문자열 정렬이 아닌, 숫자를 반영한 정렬 기능 구현
영문 대소문자, 숫자, 공백, ., - 로만 이루어짐.
head: 숫자가 아닌 문자로 이루어짐. 최소 한 글자 이상
Number: 한글자에서 다섯글자 사이의 연속된 숫자. 앞에 0올수도
tail: 나머지 부분 - 숫자 등장 가능.

정렬 기준
- head 부분 기준으로 사전 순 정렬. 대소문자 구분 x -> 대소 구분: 복사본으로 정렬하면 될 듯?
-> Number의 숫자 순으로 정렬. 숫자 앞 0 무시. Int로 변환해서 정렬하면 될 듯
-> head, number 같다면 원래 입력에 주어진 순서 유지.
*/

func solution(_ files:[String]) -> [String] {
    return files
        .map { parse(Array($0)) }
        .sorted { Int($0[1]) ?? 0 < Int($1[1]) ?? 0 }
        .sorted { $0[0].lowercased() < $1[0].lowercased() }
        .map { $0.joined(separator: "") }
}

func parse(_ file: [Character]) -> [String] {
    
    var head = [Character]()
    var number = [Character]()
    var tail = [Character]()
    var stack = [Character]()
    
    for i in 0..<file.count {
        // tail은 head, number와 같은 성질의 원소를 가지므로 tail을 가장 먼저 검사하면
        // head, number를 간단한 조건문으로 검사할 수 있음.
        // number의 끝 부분 검사
        if file[i].isNumber && (i + 1) < file.count && !file[i + 1].isNumber {
            number.append(file[i])
            tail = Array(file[(i + 1)...(file.count - 1)])
            break
        } else if !file[i].isNumber {
            head.append(file[i])
        } else if file[i].isNumber {
            number.append(file[i])
        }
    }
    
    return [String(head), String(number), String(tail)]
}
