# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque

class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        maxDepth = 0

        if root is None:
            return maxDepth
        
        q = deque()
        q.append((root, 1))
        
        while q:
            (cur_node, depth) = q.popleft()
            maxDepth = max(maxDepth, depth)
            if cur_node.left != None:
                q.append((cur_node.left, depth + 1))
            if cur_node.right != None:
                q.append((cur_node.right, depth + 1))
                
        return maxDepth
        
        