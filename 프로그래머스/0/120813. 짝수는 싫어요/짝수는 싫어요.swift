import Foundation

func solution(_ n:Int) -> [Int] {
    return (0...n).sorted().filter { $0 % 2 == 1 }
}