import Foundation
/**
2차원 배열을 1차원 배열로 만들었을 때, 1차원 배열의 인덱스 k라고 하면
k = row * n + col 관계 성립.
row와 col과 진짜 숫자의 관계는 둘 중 max + 1.
따라서 k -> row, col -> num 과정을 거쳐 num을 찾으면 됨.
*/
func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    return (Int(left)...Int(right)).map { max($0 / n, $0 % n) + 1 }
}