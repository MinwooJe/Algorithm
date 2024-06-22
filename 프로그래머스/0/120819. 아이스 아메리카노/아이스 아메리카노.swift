import Foundation

func solution(_ money:Int) -> [Int] {
    var answer: [Int] = []
    let count = money / 5500
    let remainder = money - count*5500
    return [count, remainder]
}