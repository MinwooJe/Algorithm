import Foundation

func solution(_ s:String) -> [Int] {
    let tupleSet = parse(s).sorted { $0.count < $1.count }
    var result = [Int]()
    var resultSet = [Int]()     // 중복 검사를 빠르게 하기 위함.
    
    for subset in tupleSet {
        for s in subset {
            if !resultSet.contains(s) {
                result.append(s)
                resultSet.append(s)
            }
        }
    }

    return result
}

func parse(_ str: String) -> [[Int]] {
    var result = [[Int]]()
    var num = ""
    var temp = [Int]()
    var isOpenParthesis = false
    let arr = Array(str)

    for i in 1..<(arr.count - 1) {
        let element = arr[i]

        if element == "{" {
            isOpenParthesis = true
        } else if element == "}" {
            if num.count > 0 {
                temp.append(Int(String(num))!)
                num = ""
            } 
            isOpenParthesis = false
            result.append(temp)
            temp = []
        } else if element == "," {
            if isOpenParthesis {
                temp.append(Int(String(num))!)
                num = ""
            }
        } else if element.isNumber {
            num += String(element)
        }
    }

    return result
}