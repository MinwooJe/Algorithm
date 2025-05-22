/**
- 캐시 사이즈 0일수도
- 도시 이름 대소 구분 x

캐시 히트: 1
캐시 미스: 5

*/
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var result = 0
    var cache = [String]()
    guard cacheSize > 0 else { return 5 * cities.count }
    
    for city in cities {
        let city = city.lowercased()
        
        if cache.contains(city) {
            let index = cache.firstIndex(of: city)!
            cache.remove(at: index)
            result += 1
        } else {
            if cache.count == cacheSize {
                cache.remove(at: 0)
            }
            result += 5
        }
        cache.append(city)
    }
    
    return result
}