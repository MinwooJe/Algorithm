// cities: 10만 -> 시간 복잡도 주의
/**
LRU:
가장 오래된 놈 제거
재참조 -> 큐의 가장 뒤로
*/
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    let cache = Cache()
    var result = 0
    
    guard cacheSize != 0 else { return cities.count * 5 }
    
    for city in cities {
        let city = city.lowercased()
        let executionTime = cache.caching(city, cacheSize)
        result += executionTime
    }
    
    return result
}

class Cache {
    var cache = [String]()
    
    func caching(_ city: String, _ cacheSize: Int) -> Int {
        if cache.contains(city) {
            let idx = cache.firstIndex(of: city)!
            let poppedCity = cache.remove(at: idx)
            cache.append(poppedCity)
            return 1
        } else if cache.count < cacheSize {
            cache.append(city)
            return 5
        } else {
            cache.removeFirst()
            cache.append(city)
            return 5
        }
    }
}