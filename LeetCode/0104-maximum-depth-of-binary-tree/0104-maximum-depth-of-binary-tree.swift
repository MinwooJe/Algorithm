/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        
        var maxDepth = 0
        var queue = [(TreeNode, Int)]()
        queue.append((root, 1))
        
        while !queue.isEmpty {
            let (curNode, curDepth) = queue.removeFirst()
            maxDepth = max(curDepth, maxDepth)
            
            if let left = curNode.left {
                queue.append((left, curDepth + 1))
            }
            
            if let right = curNode.right {
                queue.append((right, curDepth + 1))
            }
        }
        
        return maxDepth
    }
}