def solution(nums):
    diff = len(set(nums))
    return min(len(nums)/2, diff)