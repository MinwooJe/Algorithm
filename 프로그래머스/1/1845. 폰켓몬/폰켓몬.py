def solution(nums):
    diff = set(nums)
    return min(len(nums)/2, len(diff))