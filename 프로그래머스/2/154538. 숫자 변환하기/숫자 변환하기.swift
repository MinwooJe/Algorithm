import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var memo = [Int: Int]()
    
    func dp(_ curr: Int) -> Int {
        if curr == x {
            return 0
        } else if curr < x {
            return -1
        }
        
        if memo[curr] == nil {
            var arr = [Int]()
            arr.append(dp(curr - n))
            
            if curr % 2 == 0 && curr / 2 >= x {
                arr.append(dp(curr / 2))
            }
            if curr % 3 == 0 && curr / 3 >= x {
                arr.append(dp(curr / 3))
            }
            arr = arr.filter { $0 >= 0 }
            memo[curr] = arr.count > 0 ? arr.min()! + 1 : -1
        }
        
        return memo[curr]!
    }
    
    return dp(y)
}
