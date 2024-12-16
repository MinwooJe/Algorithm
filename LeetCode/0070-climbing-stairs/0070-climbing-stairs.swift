class Solution {
    func climbStairs(_ n: Int) -> Int {
        var table = [Int: Int]()
        (table[1], table[2]) = (1, 2)

        guard n != 1 && n != 2 else { return table[n]! }
        for i in 3...n {
            table[i] = table[i - 1]! + table[i - 2]!
        }

        return table[n]!
    }
}