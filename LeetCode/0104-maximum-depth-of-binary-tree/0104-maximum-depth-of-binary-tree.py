# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque

class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        max_depth = 0
        if root is None:
            return max_depth
        
        queue = deque()
        queue.append((root, 1))

        while queue:
            (curr, height) = queue.popleft()
            max_depth = height
            if curr.left:
                queue.append((curr.left, height+1))
            if curr.right:
                queue.append((curr.right, height+1))
        
        return max_depth