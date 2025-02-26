import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var memo = [Int: Int]()
    
    func dp(_ k: Int) -> Int {
        if k == x {
            return 0
        }
        if k < x {
            return -1
        }
        
        if memo[k] == nil {
            var arr = [Int]()
            arr.append(dp(k - n))
            if k % 2 == 0 && k / 2 >= x {
                arr.append(dp(k / 2))
            }
            if k % 3 == 0 && k / 3 >= x {
                arr.append(dp(k / 3))
            }
            
            arr = arr.filter { $0 >= 0 }
            
            if arr.count > 0 {
                memo[k] = arr.min()! + 1
            } else {
                memo[k] = -1
            }
            
        }
        
        return memo[k]!
    }
    
    return dp(y)
}
