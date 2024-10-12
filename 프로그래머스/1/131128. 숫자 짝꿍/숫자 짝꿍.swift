import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var pairHash = [Character: Int]()
    var result = ""
    
    (0...9).forEach { num in
        let numCountX = X.filter { $0 == Character(String(num)) }.count
        let numCountY = Y.filter { $0 == Character(String(num)) }.count
        
        pairHash[Character(String(num)), default: 0] = min(numCountX, numCountY)
    }
    
    for i in (0...9).reversed() {
        let num = Character(String(i))
        result += String(repeating: num, count: pairHash[num] ?? 0)
    }
    
    if result.isEmpty {
        return "-1"
    }
    
    if result.allSatisfy( { $0 == "0"} ) {
        return "0"
    }
    
    return result
}