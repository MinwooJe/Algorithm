/// 캐시 크기에 따른 실행 시간 측정 프로그램
/// 캐시 크기가 최대 30 -> 배열 사용해도 될 듯
/**
각 도시 이름: 대소문자 구분 안함.
*/
var cache = [String]()
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    guard cacheSize != 0 else { return 5 * cities.count }
    let cities = cities.map { $0.lowercased() }
    var result = 0
    
    for city in cities {
        let time = caching(city, cacheSize)
        result += time
    }
    
    return result
}

func caching(_ city: String, _ cacheSize: Int) -> Int {
    if cache.contains(city) {
        let idx = cache.firstIndex(of: city)!
        cache.remove(at: idx)
        cache.append(city)
        return 1
    } else {
        if cache.count >= cacheSize {
            cache.removeFirst()
        }
        cache.append(city)
        return 5
    }
}