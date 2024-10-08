import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var cards1 = cards1
    var cards2 = cards2
    
    for target in goal {
        if !cards1.isEmpty && cards1[0] == target {
            cards1.removeFirst()
        } else if !cards2.isEmpty && cards2[0] == target {
            cards2.removeFirst()
        } else {
            return "No"
        }        
    }
    
    return "Yes"
}