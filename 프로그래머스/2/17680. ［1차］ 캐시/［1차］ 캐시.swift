func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache = [String]()
    var executionTime = 0
    
    guard cacheSize != 0 else {
        return cities.count * 5
    }
    
    for city in cities {
        let city = city.lowercased()
        if cache.contains(city) {
            executionTime += 1
            cache.remove(at: cache.firstIndex(of: city)!)
        } else {
            executionTime += 5
            if cache.count >= cacheSize {
                cache.removeFirst()
            }
        }
        cache.append(city)
    }
    
    return executionTime
}