def solution(nums):
    max_count = len(nums) / 2
    different_count = len(set(nums))
    return min(different_count, max_count)