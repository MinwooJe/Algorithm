(n, m) = map(int, input().split())
nums = [i for i in range(1, n + 1)]
answer = []

def bruteforce(curr):
    if len(curr) == m:
        seq = ' '.join(map(str, curr))
        answer.append(seq)
        return
    
    for i in range(0, len(nums)):
        curr.append(nums[i])
        bruteforce(curr)
        curr.pop()

bruteforce([])

for ans in answer:
    print(ans)