def solution(nums):
    distinct_len = len(set(nums))
    if len(nums)/2 > distinct_len:
        return distinct_len
    else:
        return len(nums)/2