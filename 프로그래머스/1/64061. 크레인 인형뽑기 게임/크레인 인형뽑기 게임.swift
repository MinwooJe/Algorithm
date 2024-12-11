import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var basket = [Int]()
    var result = 0
    
    for move in moves {
        let row = move - 1
        var col = 0
        
        while col < board.count - 1 && board[col][row] == 0 {
            col += 1
        }
        
        guard board[col][row] != 0 else { continue }
        
        basket.append(board[col][row])
        board[col][row] = 0
        
        if basket.count >= 2
            && basket[basket.count - 1] == basket[basket.count - 2] {
                basket.removeLast()
                basket.removeLast()
                result += 2
            }
    }
    
    return result
}

