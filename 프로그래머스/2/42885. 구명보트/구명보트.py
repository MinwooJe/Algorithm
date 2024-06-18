def solution(people, limit):
    people.sort()
    answer = 0
    l, r = 0, len(people)-1
    while r >= l:
        if people[l] + people[r] <= limit:
            l, r = l+1, r-1
            answer += 1
        else:
            r -= 1
            answer += 1
    
    return answer