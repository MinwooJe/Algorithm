import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    // 장르별 재생횟수 합산 해시
    // [고유번호: (장르, 재생횟수)]
    // 많이 재생된 장르 기준 정렬, 재생횟수, 인덱스대로 정렬
    let musicCount = genres.count
    var genreTotalDict = [String: Int]()
    var sortDict = [Int: (String, Int)]()
    var genreCountDict = [String: Int]()
    
    for i in 0..<musicCount {
        genreTotalDict[genres[i], default: 0] += plays[i]
        sortDict[i] = (genres[i], plays[i])
    }
    
    let result = sortDict
        .sorted { $0.key < $1.key }
        .sorted { $0.value.1 > $1.value.1}
        .sorted { genreTotalDict[$0.value.0]! > genreTotalDict[$1.value.0]! }
        .filter {
            genreCountDict[$0.value.0, default: 0] += 1
            return genreCountDict[$0.value.0]! <= 2
        }
        .map { $0.key }
    
    return result
}
