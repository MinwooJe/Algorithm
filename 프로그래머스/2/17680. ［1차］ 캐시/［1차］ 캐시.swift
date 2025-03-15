// 도시 이름 입력 받고, 캐시 저장, LRU 사용.
// hit: 1, miss: 5
// 주의: 도시 이름 대소문자 구분 x
    /**
    1. 캐시에 없다. -> 캐시에 추가
        1.1 캐시 꽉 찼다. -> removeFirst(), append
        1.2 캐시 자리 남았다. -> append()
        result += 5
    2. 캐시에 있다. -> result += 1
        2.1 캐시의 맨 뒤에 있다. -> continue
        2.2 else -> 해당 인덱스 찾아서 삭제 -> append
    */
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    guard cacheSize != 0 else { return 5 * cities.count }
    var cache = [String]()      // cacheSize가 30이하이므로 배열도 성능 크게 상관 없을 듯.
    var result = 0
    
    for city in cities {
        let city = city.lowercased()
        if cache.contains(city) {
            if !cache.isEmpty && cache[cache.count - 1] != city {
                let idx = cache.firstIndex(of: city)!
                cache.remove(at: idx)
                cache.append(city)
            }
            result += 1
        } else {
            if cache.count == cacheSize {
                cache.removeFirst()
                cache.append(city)
            } else {
                cache.append(city)
            }
            result += 5
        }
    }

    return result
}