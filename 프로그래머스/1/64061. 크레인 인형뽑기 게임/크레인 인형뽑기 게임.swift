import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var basket = [Int]()
    var result = 0
    
    for move in moves {
        var row = 0
        let col = move - 1
        
        while row < board.count {
            if board[row][col] == 0 {
                row += 1
            } else {
                break
            }
        }
        
        guard row < board.count else { continue }
        
        basket.append(board[row][col])
        board[row][col] = 0
        
        let basketMax = basket.count
        if basketMax >= 2 
        && basket[basketMax - 1] == basket[basketMax - 2] {
            basket.removeLast()
            basket.removeLast()
            result += 2
        }
        
    }
    
    return result
}