def solution(brown, yellow):
    answer = [] 
    brown_height = []
    brown_width = []
    size = brown + yellow
    end = int(size**0.5)
    # 약수 짝 다 찾고
    for i in range(1, end+1):
        if size % i == 0:
            brown_height.append(i)
            brown_width.append(size/i)

    # 거기서 -2 씩 뺀게 yellow랑 같은지 확인
    for h, w in zip(brown_height, brown_width):
        if (h-2) * (w-2) == yellow:
            return [w, h]
    return answer