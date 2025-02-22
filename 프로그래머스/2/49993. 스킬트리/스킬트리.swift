import Foundation
/**
백트래킹?
skill_trees 순회
skillSet, skillStack
if skillSet.contains(c) in skill_tree {
    if skillStack[-1] == c {
        stack.pop
}
}
*/
func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var result = 0

    for skill_tree in skill_trees {
        var flag = true
        let skillSet = Set(skill)
        var skillStack = Array(skill.reversed())

        for skill in skill_tree {
            if skillSet.contains(skill) {
                if skill == skillStack[skillStack.count - 1] {
                    skillStack.removeLast()
                    continue
                } else {
                    flag = false
                    break
                }
            }
        }
        result += flag ? 1 : 0
    }

    return result
}