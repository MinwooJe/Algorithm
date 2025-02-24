import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var result = 0
    
    for tree in skill_trees {
        var skill = Array(skill)
        var flag = true
        for s in tree {
            if skill.contains(s) && !skill.isEmpty {
                guard s == skill[0] else {
                    flag = false
                    break
                }
                skill.removeFirst()
            }
        }
        result += flag ? 1 : 0
    }
    return result
}