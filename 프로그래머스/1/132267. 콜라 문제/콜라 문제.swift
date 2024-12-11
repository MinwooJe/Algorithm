import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var currBottle = n
    var result = 0
    
    while currBottle >= a {
        let newBottle = (currBottle / a) * b
        currBottle += newBottle - (currBottle / a) * a
        result += newBottle
    }
    
    return result
}