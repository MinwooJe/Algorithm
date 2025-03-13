import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    let skillTrees = skill_trees.map { $0.map { String($0) } }
    let skill = skill.map { String($0) }
    var result = 0

    for skillTree in skillTrees {
        let stack = skillTree.filter { skill.contains($0) }
        var isValid = true

        for i in 0..<stack.count {
            if skill[i] != stack[i] {
                isValid = false
            }
        }
        
        result += isValid ? 1 : 0
    }
    
    return result
}