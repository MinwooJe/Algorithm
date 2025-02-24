import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    return skill_trees.map { isAvailable(skill, $0) }.filter { $0 }.count
}

func isAvailable(_ skill: String, _ tree: String) -> Bool {
    let filtered = tree.filter { skill.contains($0) }
    return skill.starts(with: filtered)
}