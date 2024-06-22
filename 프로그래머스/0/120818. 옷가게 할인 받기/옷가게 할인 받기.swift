import Foundation

func solution(_ price:Int) -> Int {
    var answer = Double(price)
    
    switch price {
        case 500000...: 
            answer = Double(price) * 0.8
        case 300000...500000:
            answer = Double(price) * 0.9
        case 100000...300000:
            answer = Double(price) * 0.95
        default:
            break
    }
    
    return Int(answer)
}