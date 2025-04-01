import heapq
"""
1. 스코빌 배열에서 최솟값 두 개 찾기 -> 둘 다 K를 넘는지 확인
안넘는다면
2. 섞기
3. 삽입

최솟값을 찾는데 비용 큼 -> 힙 사용
"""
def solution(scoville, K):
    isSuccess = False
    answer = 0
    foods = scoville
    heapq.heapify(scoville)
    
    while len(foods) >= 2 :
        min1 = heapq.heappop(foods)
        min2 = heapq.heappop(foods)
        
        if min1 >= K:
            isSuccess = True
            break
        
        new = min1 + min2 * 2
        heapq.heappush(foods, new)
        answer += 1
    
    if foods and heapq.heappop(foods) >= K:
        isSuccess = True
    
    if isSuccess:
        return answer
    else:
        return -1