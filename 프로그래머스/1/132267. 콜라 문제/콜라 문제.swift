import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var result = 0
    var emptyBottle = n

    while emptyBottle >= a {
        let emptyBottleBundle = emptyBottle / a
        // emptyBottle += -emptyBottleBundle * a + emptyBottleBundle * b
        emptyBottle += (b - a) * emptyBottleBundle
        result += b * emptyBottleBundle
    }
    
    return result
}