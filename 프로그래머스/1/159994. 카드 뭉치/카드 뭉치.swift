import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var cards1 = cards1
    var cards2 = cards2
    
    for c in goal {
        if let cards1First = cards1.first,
        let cards2First = cards2.first {
            if cards1First == c {
                cards1.removeFirst()
            } else if cards2First == c {
                cards2.removeFirst()
            } else {
                return "No"
            }
        }
    }
    
    return "Yes"
}