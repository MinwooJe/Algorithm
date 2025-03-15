import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    return skill_trees
        .filter { 
            let tree = $0.filter { skill.contains($0) } 
            return skill.starts(with: tree)
        }
        .count
}